//
//  Segments.swift
//  mllp
//
//  Created by cbaeza on 3/15/19.
//

import Foundation

public struct Segments {
    
    public static func MSH(
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
    
    public static func PID(
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
    
    public static func PV1(
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
    
    public static func ORC(
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
    
    //----------------------------------------------------------------------
    
    public static func OBR(
        spsProtocolCode                  OBR_4: String?,
        isrDangerCode                   OBR_12: String?,
        isrRelevantClinicalInfo         OBR_13: String?,
        isrReferringPhysician           OBR_16: String?,
        isrAccessionNumber              OBR_18: String?,
        rpID                            OBR_19: String?,
        spsID                           OBR_20: String?,
        spsStationAETitle               OBR_21: String,
        spsModality                     OBR_24: String?,
        rpTransportationMode            OBR_30: String?,
        rpReasonForStudy                OBR_31: String?,
        isrNameOfPhysiciansReadingStudy OBR_32: String?,
        spsTechnician                   OBR_34: String?,
        rpUniversalStudyCode            OBR_44: String?
        )
        -> String
    {
        let uniqueRpID_SpsID = Date().timeIntervalSinceReferenceDate
        return String(format:"OBR||||%@||||||||%@|%@|||%@||%@|%@|%@|%@|||%@||||||%@|%@|%@||%@||||||||||%@",
            OBR_4 ?? "",
            OBR_12 ?? "",
            OBR_13 ?? "",
            OBR_16 ?? "",
            OBR_18 ?? "",
            OBR_19 ?? "\(uniqueRpID_SpsID)",
            OBR_20 ?? "\(uniqueRpID_SpsID)",
            OBR_21,
            OBR_24 ?? "",
            OBR_30 ?? "",
            OBR_31 ?? "",
            OBR_32 ?? "",
            OBR_34 ?? "",
            OBR_44 ?? "")
    }
    
    //----------------------------------------------------------------------
    
    public static func ZDS(StudyInstanceUID ZDS_1: String?) -> String {
        return String(format: "ZDS|%@", ZDS_1 ?? "1.2")
    }
    
}
