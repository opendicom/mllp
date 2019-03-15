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
        -> String
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
        PatientName              PID_5: String,
        MotherMaidenName         PID_6: String?,
        PatientBirthDate         PID_7: String?,
        PatientAdministrativeSex PID_8: String?
        )
        -> String
    {
        return String(format:"PID|||%@||%@|%@|%@|%@",
                      PID_3,
                      PID_5,
                      PID_6 ?? "",
                      PID_7 ?? "",
                      PID_8 ?? "")
    }
    
    //----------------------------------------------------------------------
    
    static func PV1(
        VisitNumber         PV1_8: String?,
        ReferringDoctor    PV1_15: String?,
        AmbultatoryStatus  PV1_19: String?
        )
        -> String
    {
        return String(format: "PV1||||||||%@|||||||%@||||%@",
                      PV1_8 ?? "",
                      PV1_15 ?? "",
                      PV1_19 ?? "")
    }
    
    //----------------------------------------------------------------------
    
    static func ORC(
        OrderControl            ORC_1: String?,
        sendingRisName          ORC_2: String?,
        receivingPacsaet        ORC_3: String?,
        isrPlacerDT            ORC_2_: String?,
        isrFillerScheduledDT   ORC_3_: String?,
        spsOrderStatus          ORC_4: String?,
        spsDateTime             ORC_7: String?,
        rpPriority             ORC_7_: String?,
        EnteringDevice         ORC_18: String?
        )
        -> String
    {
        let DTnow: String = DICMTypes.DTString(fromDate: Date())
        return String(format: "ORC|%@|%@^%@|%@^%@||%@||^^^%@^^%@|||||||||||%@",
                      ORC_1 ?? "NW",
                      ORC_2 ?? "HIS",
                      ORC_2_ ?? DTnow,
                      ORC_3 ?? "CUSTODIAN",
                      ORC_3_ ?? DTnow,
                      ORC_4 ?? "SC",
                      ORC_7 ?? DTnow,
                      ORC_7_ ?? "T",
                      ORC_18 ?? "IP")
    }
    
}
