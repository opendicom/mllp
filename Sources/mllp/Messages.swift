//
//  Messages.swift
//  mllp
//
//  Created by cbaeza on 3/15/19.
//

import Foundation
import os.log

let segmentsHL7 = OSLog(subsystem: Bundle.main.bundleIdentifier!, category: "HL7 Segments")


public struct Messages {
    
    public static func A01(
        admitInpatient          VersionID: String?,
        sendingRisName              MSH_3: String?,
        sendingRisIP                MSH_4: String?,
        receivingCustodianTitle     MSH_5: String?,
        receivingPacsaet            MSH_6: String?,
        MessageControlId           MSH_10: String?,
        CountryCode                MSH_17: String?,
        CharacterSet       stringEncoding: CFStringEncoding?,
        PrincipalLanguage          MSH_19: String?,
        PatientIdentifierList       PID_3: String,
        PatientName                 PID_5: String,
        PatientBirthDate            PID_7: String?,
        PatientAdministrativeSex    PID_8: String?
        ) -> String?
    {
        
        let MSH: String? = Segments.MSH(
            SendingApplication  :MSH_3,
            SendingFacility     :MSH_4,
            ReceivingApplication:MSH_5,
            ReceivingFacility   :MSH_6,
            MessageType         :"ADT^A01^ADT_A01",
            MessageControlID    :MSH_10,
            VersionID           :VersionID,
            CountryCode         :MSH_17,
            CharacterSet        :stringEncoding,
            PrincipalLanguage   :MSH_19
        )
        
        guard let _MSH = MSH else {
            os_log("[A01][MSH] return nil", log: segmentsHL7, type: .error)
            return nil
        }
        
        let PID: String? = Segments.PID(
            PatientIdentifierList   :PID_3,
            PatientName             :PID_5,
            MotherMaidenName        :nil,
            PatientBirthDate        :PID_7,
            PatientAdministrativeSex:PID_8
        )
        
        guard let _PID = PID else {
            os_log("[A01][PID] return nil", log: segmentsHL7, type: .error)
            return nil
        }
        
        return String(format: "%@\r%@\r", _MSH, _PID)
    }
    
    //----------------------------------------------------------------------
    
    public static func A04(
        registerPatient         VersionID: String?,
        sendingRisName              MSH_3: String?,
        sendingRisIP                MSH_4: String?,
        receivingCustodianTitle     MSH_5: String?,
        receivingPacsaet            MSH_6: String?,
        MessageControlId           MSH_10: String?,
        CountryCode                MSH_17: String?,
        CharacterSet       stringEncoding: CFStringEncoding?,
        PrincipalLanguage          MSH_19: String?,
        PatientIdentifierList       PID_3: String,
        PatientName                 PID_5: String,
        PatientBirthDate            PID_7: String?,
        PatientAdministrativeSex    PID_8: String?
        ) -> String?
    {
        
        let MSH: String? = Segments.MSH(
            SendingApplication  :MSH_3,
            SendingFacility     :MSH_4,
            ReceivingApplication:MSH_5,
            ReceivingFacility   :MSH_6,
            MessageType         :"ADT^A04^ADT_A01",
            MessageControlID    :MSH_10,
            VersionID           :VersionID,
            CountryCode         :MSH_17,
            CharacterSet        :stringEncoding,
            PrincipalLanguage   :MSH_19
        )
        
        guard let _MSH = MSH else {
            os_log("[A04][MSH] return nil", log: segmentsHL7, type: .error)
            return nil
        }
        
        let PID: String? = Segments.PID(
            PatientIdentifierList   :PID_3,
            PatientName             :PID_5,
            MotherMaidenName        :nil,
            PatientBirthDate        :PID_7,
            PatientAdministrativeSex:PID_8
        )
        
        guard let _PID = PID else {
            os_log("[A04][PID] return nil", log: segmentsHL7, type: .error)
            return nil
        }
        
        return String(format: "%@\r%@\r", _MSH, _PID)
    }
    
    //----------------------------------------------------------------------
    
    public static func O01(
        singleSps                       VersionID: String?,
        sendingRisName                  MSH_3: String?,
        sendingRisIP                    MSH_4: String?,
        receivingCustodianTitle         MSH_5: String?,
        receivingPacsaet                MSH_6: String?,
        MessageControlId                MSH_10: String?,
        CountryCode                     MSH_17: String?,
        CharacterSet                  stringEncoding: CFStringEncoding?,
        PrincipalLanguage               MSH_19: String?,
        PatientIdentifierList           PID_3: String,
        PatientName                     PID_5: String,
        MotherMaidenName                PID_6: String?,
        PatientBirthDate                PID_7: String?,
        PatientAdministrativeSex        PID_8: String?,
        isrPatientInsuranceShortName    PV1_8: String,
        isrPlacerNumber                 ORC_2: String,
        isrFillerNumber                 ORC_3: String,
        spsOrderStatus                  ORC_5: String,
        spsDateTime                     ORC_7: String,
        rpPriority                      ORC_7_: String,
        spsProtocolCode                 OBR_4: String,
        isrDangerCode                   OBR_12: String,
        isrRelevantClinicalInfo         OBR_13: String,
        isrReferringPhysician           OBR_16: String,
        isrAccessionNumber              OBR_18: String,
        rpID                            OBR_19: String,
        spsID                           OBR_20: String,
        spsStationAETitle               OBR_21: String,
        spsModality                     OBR_24: String,
        rpTransportationMode            OBR_30: String,
        rpReasonForStudy                OBR_31: String,
        isrNameOfPhysiciansReadingStudy OBR_32: String,
        spsTechnician                   OBR_34: String,
        rpUniversalStudyCode            OBR_44: String,
        isrStudyInstanceUID             ZDS_1: String
        )
        -> String?
    {
        let MSH: String? = Segments.MSH(
            SendingApplication  :MSH_3,
            SendingFacility     :MSH_4,
            ReceivingApplication:MSH_5,
            ReceivingFacility   :MSH_6,
            MessageType         :"ORM^O01",
            MessageControlID    :MSH_10,
            VersionID           :VersionID,
            CountryCode         :MSH_17,
            CharacterSet        :stringEncoding,
            PrincipalLanguage   :MSH_19
        )
        guard let _MSH = MSH else {
            os_log("[O01][MSH] return nil", log: segmentsHL7, type: .error)
            return nil
        }
        
        
        let PID: String? = Segments.PID(
        PatientIdentifierList   :PID_3,
        PatientName             :PID_5,
        MotherMaidenName        :nil,
        PatientBirthDate        :PID_7,
        PatientAdministrativeSex:PID_8
        )
        guard let _PID = PID else {
            os_log("[O01][PID] return nil", log: segmentsHL7, type: .error)
            return nil
        }
        
        
        let PV1: String? = Segments.PV1(
        VisitNumber      :PV1_8,
        ReferringDoctor  :"",
        AmbultatoryStatus:""
        )
        guard let _PV1 = PV1 else {
            os_log("[O01][PV1] return nil", log: segmentsHL7, type: .error)
            return nil
        }
        
        let ORC: String? = Segments.ORC(
        OrderControl        :"NW",
        sendingRisName      :ORC_2,
        receivingPacsaet    :ORC_3,
        isrPlacerDT         :nil,
        isrFillerScheduledDT:ORC_7,
        spsOrderStatus      :ORC_5,
        spsDateTime         :ORC_7,
        rpPriority          :ORC_7_,
        EnteringDevice      :MSH_4
        )
        guard let _ORC = ORC else {
            os_log("[O01][ORC] return nil", log: segmentsHL7, type: .error)
            return nil
        }
        
        let OBR: String? = Segments.OBR(
        spsProtocolCode                :OBR_4,
        isrDangerCode                  :OBR_12,
        isrRelevantClinicalInfo        :OBR_13,
        isrReferringPhysician          :OBR_16,
        isrAccessionNumber             :OBR_18,
        rpID                           :OBR_19,
        spsID                          :OBR_20,
        spsStationAETitle              :OBR_21,
        spsModality                    :OBR_24,
        rpTransportationMode           :OBR_30,
        rpReasonForStudy               :OBR_31,
        isrNameOfPhysiciansReadingStudy:OBR_32,
        spsTechnician                  :OBR_34,
        rpUniversalStudyCode           :OBR_44
        )
        guard let _OBR = OBR else {
            os_log("[O01][OBR] return nil", log: segmentsHL7, type: .error)
            return nil
        }
        
        let ZDS: String? = Segments.ZDS(StudyInstanceUID: ZDS_1)
        guard let _ZDS = ZDS else {
            os_log("[O01][ZDS] return nil", log: segmentsHL7, type: .error)
            return nil
        }
        
        return String(format:"%@\r%@\r%@\r%@\r%@\r%@\r",_MSH,_PID,_PV1,_ORC,_OBR,_ZDS);
    }
}
