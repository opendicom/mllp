# mllp

Library swift 5

## Contains

- structures for messages (O01, A01, A04)
- structures for segments (MSH, PID, PV1, ORC, OBR, ZDS)
- mllp send class

## Build

Compatibility with macosx10.14.4+ (which includes swift5) and XCode 10.2

To avoid warnings use build command:

    swift build -Xswiftc "-target" -Xswiftc "x86_64-apple-macosx10.12" 
