//
//  mllpSend.swift
//  mllp
//
//  Created by cbaeza on 3/18/19.
//

import Foundation

public struct mllpSend {
    

    public static func send(
        to ipString: String,
        port portString: String,
        message: String,
        stringEncoding: String.Encoding,
        payload: inout String
        ) -> Bool
    {
        var SB: UInt8=0x0b
        var EB: UInt8=0x1c
        var CR: UInt8=0x0d
        //create stream structures
        var inputStream: InputStream?
        var outputStream: OutputStream?
        Stream.getStreamsToHost(withName: ipString, port: Int(portString)! , inputStream: &inputStream, outputStream: &outputStream)
        if (outputStream==nil)
        {
            payload.append(contentsOf: String(format:"can not create output stream to %@:%@",ipString,portString))
            return false;
        }
        if (inputStream==nil)
        {
            payload.append(contentsOf: String(format:"can not create input stream to %@:%@",ipString,portString))
            return false;
        }
        //send message
        outputStream?.open()
        var data = Data()
        data.append(&SB, count: 1)
        data.append(message.data(using: stringEncoding)!)
        data.append(&EB, count: 1)
        data.append(&CR, count: 1)
        //Data in swift does not allow to obtain the bytes, it must be copied in UnsafeMutablePointer
        let dataMutablePointer = UnsafeMutablePointer<UInt8>.allocate(capacity: data.count)
        data.copyBytes(to: dataMutablePointer, count: data.count)
        let dataPointer = UnsafePointer<UInt8>(dataMutablePointer)
        outputStream?.write(dataPointer, maxLength: data.count)
        //Get error
        let outputStreamError = outputStream?.streamError
        outputStream?.close()
        outputStream = nil
        if (outputStreamError != nil)
        {
            payload.append(contentsOf: String(format:">%@:%@\r\n%@",ipString,portString, outputStreamError.debugDescription))
            return false;
        }
        //receive payload
        inputStream?.open()
        let readMutablePointer = UnsafeMutablePointer<UInt8>.allocate(capacity: 1024)
        let bytesRead = inputStream?.read(readMutablePointer, maxLength: 1024) ?? 0
        let inputStreamError = inputStream?.streamError
        inputStream?.close()
        inputStream = nil
        if (inputStreamError != nil)
        {
            payload.append(contentsOf: String(format:"<%@:%@\r\n%@",ipString,portString, inputStreamError.debugDescription))
            return false;
        }
        payload.append(contentsOf: String(bytesNoCopy: readMutablePointer, length: bytesRead, encoding: String.Encoding.ascii, freeWhenDone: true)! )
        return true
    }
}
