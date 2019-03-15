//
//  Messages.swift
//  mllp
//
//  Created by cbaeza on 3/15/19.
//

import Foundation

public struct Messages {
    public static func A01(
        admitInpatient          VersionID: String?,
        sendingRisName              MSH_3: String?,
        sendingRisIP                MSH_4: String?,
        receivingCustodianTitle     MSH_5: String?,
        receivingPacsaet            MSH_6: String?,
        MessageControlId           MSH_10: String?,
        CountryCode                MSH_17: String?,
        stringEncoding: CFStringEncoding?,
        PrincipalLanguage          MSH_19: String?,
        PatientIdentifierList       PID_3: String,
        PatientName                 PID_5: String,
        PatientBirthDate            PID_7: String?,
        PatientAdministrativeSex    PID_8: String?
        ) -> String? {
        
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
        
        guard let _MSH = MSH else { return nil }
        
        let PID: String? = Segments.PID(
            PatientIdentifierList   :PID_3,
            AlternatePatientID      :nil,
            PatientName             :PID_5,
            MotherMaidenName        :nil,
            PatientBirthDate        :PID_7,
            PatientAdministrativeSex:PID_8
        )
        
        guard let _PID = PID else { return nil }
        
        return String(format: "%@\r%@\r", _MSH, _PID)
    }
}
