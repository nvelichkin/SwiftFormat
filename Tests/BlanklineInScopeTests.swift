//
//  BlanklineInScopeTests.swift
//  SwiftFormatTests
//
//  Created by Nikita Velichkin on 09/07/2020.
//  Copyright © 2020 Nick Lockwood. All rights reserved.
//

import XCTest
@testable import SwiftFormat

class BlanklineInScopeTests: XCTestCase {

    // MARK: - Space in start/end of scope

    func testBlankLineAtStartOfScope() {
        let input = """
        struct Foo {
            var a: Int?
            var b: String?

            func b() {
                var d: Int?
            }
        }
        """

        let output = """
        struct Foo {

            var a: Int?
            var b: String?

            func b() {
                var d: Int?
            }

        }
        """

        let formattedInput = (try? format(input, rules: [FormatRules.insertBlankLinesAtScope])) ?? ""
        XCTAssertEqual(output, formattedInput)
    }

    func testBlankLineAtStartOfScope_expectNoFormatting() {
        let input = """
        struct Foo {

            var a: Int?
            var b: String?

            func b() {
                var d: Int?
            }

        }
        """

        let output = """
        struct Foo {

            var a: Int?
            var b: String?

            func b() {
                var d: Int?
            }

        }
        """

        let formattedInput = (try? format(input, rules: [FormatRules.insertBlankLinesAtScope])) ?? ""
        XCTAssertEqual(output, formattedInput)
    }

    func testBlankLineAtStartOfScope_expectFormatAtStart() {
        let input = """
        struct Foo {
            var a: Int?
            var b: String?

            func b() {
                var d: Int?
            }

        }
        """

        let output = """
        struct Foo {

            var a: Int?
            var b: String?

            func b() {
                var d: Int?
            }

        }
        """

        let formattedInput = (try? format(input, rules: [FormatRules.insertBlankLinesAtScope])) ?? ""
        XCTAssertEqual(output, formattedInput)
    }

    func testBlankLineAtStartOfScope_expectFormatAtEnd() {
        let input = """
        struct Foo {

            var a: Int?
            var b: String?

            func b() {
                var d: Int?
            }
        }
        """

        let output = """
        struct Foo {

            var a: Int?
            var b: String?

            func b() {
                var d: Int?
            }

        }
        """

        let formattedInput = (try? format(input, rules: [FormatRules.insertBlankLinesAtScope])) ?? ""
        XCTAssertEqual(output, formattedInput)
    }


    func testBlankLineAtStartOfScope_expectNoFormatSwitch() {
        let input = """
        struct Foo {

            func b() {
                switch self {
                    default:
                        break
                }
            }

        }
        """

        let output = """
        struct Foo {

            func b() {
                switch self {
                    default:
                        break
                }
            }

        }
        """

        let formattedInput = (try? format(input, rules: [FormatRules.insertBlankLinesAtScope])) ?? ""
        XCTAssertEqual(output, formattedInput)
    }

    func testBlankLineAtStartOfScope_NoFormatProtocolWithGetter() {
        let input = """
        protocol A {
            var b: Int { get }
        }
        """

        let output = """
        protocol A {
            var b: Int { get }
        }
        """

        let formattedInput = (try? format(input, rules: [FormatRules.insertBlankLinesAtScope])) ?? ""
        XCTAssertEqual(output, formattedInput)
    }

    func testBlankLineAtStartOfScope_NoFormatClassFunc() {
        let input = """
        override class func foo() -> String? {
            return ""
        }
        """

        let output = """
        override class func foo() -> String? {
            return ""
        }
        """

        let formattedInput = (try? format(input, rules: [FormatRules.insertBlankLinesAtScope])) ?? ""
        XCTAssertEqual(output, formattedInput)
    }
}
