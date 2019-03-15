//
//  Segments.swift
//  mllp
//
//  Created by cbaeza on 3/15/19.
//

import Foundation

struct Segments {
    
    static func MSH(
        SendingApplication    MSH_3: String?,
        SendingFacility       MSH_4: String?,
        ReceivingApplication  MSH_5: String?,
        ReceivingFacility     MSH_6: String?,
        MessageType           MSH_9: String,
        MessageControlID     MSH_10: String?,
        VersionID            MSH_12: String?,
        CountryCode          MSH_17: String?,
        CharacterSet stringEncoding: CFStringEncoding?,
        PrincipalLanguage    MSH_19: String?
        )
        -> String?
    {
        let MSH_18: String
        switch (stringEncoding) {
        case 1://ascii
            MSH_18="ASCII"
        case 4://utf-8
            MSH_18="UNICODE UTF-8"
        case 5:
            MSH_18="8859/1"
        default:
            MSH_18="8859/1"
        }
        
        
        return String(format: "MSH|^~\\&|%@|%@|%@|%@|%@||%@|%@|P|%@|||||%@|%@|%@",
                      MSH_3 ?? "HIS",
                      MSH_4 ?? "IP",
                      MSH_5 ?? "CUSTODIAN",
                      MSH_6 ?? "PACS",
                      DICMTypes.DAString(fromDate: Date()),
                      MSH_9,
                      MSH_10 ?? UUID.init().uuidString,
                      MSH_12 ?? "2.3.1",
                      MSH_17 ?? "CL",
                      MSH_18,
                      MSH_19 ?? "es")
    }
    
    //----------------------------------------------------------------------
    
    static func PID(
        PatientIdentifierList    PID_3: String,
        AlternatePatientID       PID_4: String?,
        PatientName              PID_5: String,
        MotherMaidenName         PID_6: String?,
        PatientBirthDate         PID_7: String?,
        PatientAdministrativeSex PID_8: String?
        )
        -> String?
    {
        return String(format:"PID|||%@|%@|%@|%@|%@|%@",
                      PID_3,
                      PID_4 ?? "",
                      PID_5,
                      PID_6 ?? "",
                      PID_7 ?? "",
                      PID_8 ?? "")
    }
}
