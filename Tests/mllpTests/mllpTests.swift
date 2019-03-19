import XCTest
@testable import mllp

final class mllpTests: XCTestCase {
    func testHL7Send() {
        let hl7 = #"""
MSH|^~\&|||||20190311||ORM^O01|01517B57-9DD7-4152-A8D3-F6112F1E878D|P|2.3.1|||||cl|8859/1|es
PID|||11111-1^^^2.16.858.1.152.68909||APELLIDO>APELLIDO^NOMBRE||19800101|M|
PV1|||||||||||||||||||
ORC|NW|IMATEC^20190311103302|IMATEC_LASERENA^20190311103302||SC||^^^20190311103302^^T|||||||||||127.0.0.1:52578
OBR||||0401051^1^RADIOGRAFIA DE PELVIS, CADERA O COXOFEMORAL||||||||||||-^-^-^MEDICO TRATANTE .||OR19H664CR1|574003982|574003982||||CR||||||||IMATEC^CR^fblumel||IMATEC^CR^fblumel||||||||||0401051^1^RADIOGRAFIA DE PELVIS, CADERA O COXOFEMORAL
ZDS|2.25.354145732298734539126994298128312842752
"""#
        var payload: String = ""
        let result = mllpSend.send(to: "127.0.0.1", port: "50530", message: hl7, stringEncoding: String.Encoding.utf8, payload: &payload)
        XCTAssertEqual(result, true)
    }

    static var allTests = [
        ("testHL7Send", testHL7Send),
    ]
}
