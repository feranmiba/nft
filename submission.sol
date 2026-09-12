// SPDX-License-Identifier: MIT
// Repository: https://github.com/feranmiba/nft.git
// Commit: 7a60ebf
// Testnet: Sepolia
// Contract: https://sepolia.etherscan.io/address/0x18F00Aef5811d3c4E69777b2a027fd61083dA377
// Deployment transaction: https://sepolia.etherscan.io/tx/0x333e050e00c6e081c36ca9de15fe0fb2c9982d9cb953b3bae685b273aa22b79d
// Mint transaction: https://sepolia.etherscan.io/tx/0x94c4aa07638530221c4cc9b3d4ad7063dc0a7a3baa15e5a5016d2f64add11119
pragma solidity ^0.8.20;

abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }

    function _contextSuffixLength() internal view virtual returns (uint256) {
        return 0;
    }
}

interface IERC165 {

    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}

interface IERC721Receiver {

    function onERC721Received(
        address operator,
        address from,
        uint256 tokenId,
        bytes calldata data
    ) external returns (bytes4);
}

library Panic {

    uint256 internal constant GENERIC = 0x00;

    uint256 internal constant ASSERT = 0x01;

    uint256 internal constant UNDER_OVERFLOW = 0x11;

    uint256 internal constant DIVISION_BY_ZERO = 0x12;

    uint256 internal constant ENUM_CONVERSION_ERROR = 0x21;

    uint256 internal constant STORAGE_ENCODING_ERROR = 0x22;

    uint256 internal constant EMPTY_ARRAY_POP = 0x31;

    uint256 internal constant ARRAY_OUT_OF_BOUNDS = 0x32;

    uint256 internal constant RESOURCE_ERROR = 0x41;

    uint256 internal constant INVALID_INTERNAL_FUNCTION = 0x51;

    function panic(uint256 code) internal pure {
        assembly ("memory-safe") {
            mstore(0x00, 0x4e487b71)
            mstore(0x20, code)
            revert(0x1c, 0x24)
        }
    }
}

library SafeCast {

    error SafeCastOverflowedUintDowncast(uint8 bits, uint256 value);

    error SafeCastOverflowedIntToUint(int256 value);

    error SafeCastOverflowedIntDowncast(uint8 bits, int256 value);

    error SafeCastOverflowedUintToInt(uint256 value);

    function toUint248(uint256 value) internal pure returns (uint248) {
        if (value > type(uint248).max) {
            revert SafeCastOverflowedUintDowncast(248, value);
        }
        return uint248(value);
    }

    function toUint240(uint256 value) internal pure returns (uint240) {
        if (value > type(uint240).max) {
            revert SafeCastOverflowedUintDowncast(240, value);
        }
        return uint240(value);
    }

    function toUint232(uint256 value) internal pure returns (uint232) {
        if (value > type(uint232).max) {
            revert SafeCastOverflowedUintDowncast(232, value);
        }
        return uint232(value);
    }

    function toUint224(uint256 value) internal pure returns (uint224) {
        if (value > type(uint224).max) {
            revert SafeCastOverflowedUintDowncast(224, value);
        }
        return uint224(value);
    }

    function toUint216(uint256 value) internal pure returns (uint216) {
        if (value > type(uint216).max) {
            revert SafeCastOverflowedUintDowncast(216, value);
        }
        return uint216(value);
    }

    function toUint208(uint256 value) internal pure returns (uint208) {
        if (value > type(uint208).max) {
            revert SafeCastOverflowedUintDowncast(208, value);
        }
        return uint208(value);
    }

    function toUint200(uint256 value) internal pure returns (uint200) {
        if (value > type(uint200).max) {
            revert SafeCastOverflowedUintDowncast(200, value);
        }
        return uint200(value);
    }

    function toUint192(uint256 value) internal pure returns (uint192) {
        if (value > type(uint192).max) {
            revert SafeCastOverflowedUintDowncast(192, value);
        }
        return uint192(value);
    }

    function toUint184(uint256 value) internal pure returns (uint184) {
        if (value > type(uint184).max) {
            revert SafeCastOverflowedUintDowncast(184, value);
        }
        return uint184(value);
    }

    function toUint176(uint256 value) internal pure returns (uint176) {
        if (value > type(uint176).max) {
            revert SafeCastOverflowedUintDowncast(176, value);
        }
        return uint176(value);
    }

    function toUint168(uint256 value) internal pure returns (uint168) {
        if (value > type(uint168).max) {
            revert SafeCastOverflowedUintDowncast(168, value);
        }
        return uint168(value);
    }

    function toUint160(uint256 value) internal pure returns (uint160) {
        if (value > type(uint160).max) {
            revert SafeCastOverflowedUintDowncast(160, value);
        }
        return uint160(value);
    }

    function toUint152(uint256 value) internal pure returns (uint152) {
        if (value > type(uint152).max) {
            revert SafeCastOverflowedUintDowncast(152, value);
        }
        return uint152(value);
    }

    function toUint144(uint256 value) internal pure returns (uint144) {
        if (value > type(uint144).max) {
            revert SafeCastOverflowedUintDowncast(144, value);
        }
        return uint144(value);
    }

    function toUint136(uint256 value) internal pure returns (uint136) {
        if (value > type(uint136).max) {
            revert SafeCastOverflowedUintDowncast(136, value);
        }
        return uint136(value);
    }

    function toUint128(uint256 value) internal pure returns (uint128) {
        if (value > type(uint128).max) {
            revert SafeCastOverflowedUintDowncast(128, value);
        }
        return uint128(value);
    }

    function toUint120(uint256 value) internal pure returns (uint120) {
        if (value > type(uint120).max) {
            revert SafeCastOverflowedUintDowncast(120, value);
        }
        return uint120(value);
    }

    function toUint112(uint256 value) internal pure returns (uint112) {
        if (value > type(uint112).max) {
            revert SafeCastOverflowedUintDowncast(112, value);
        }
        return uint112(value);
    }

    function toUint104(uint256 value) internal pure returns (uint104) {
        if (value > type(uint104).max) {
            revert SafeCastOverflowedUintDowncast(104, value);
        }
        return uint104(value);
    }

    function toUint96(uint256 value) internal pure returns (uint96) {
        if (value > type(uint96).max) {
            revert SafeCastOverflowedUintDowncast(96, value);
        }
        return uint96(value);
    }

    function toUint88(uint256 value) internal pure returns (uint88) {
        if (value > type(uint88).max) {
            revert SafeCastOverflowedUintDowncast(88, value);
        }
        return uint88(value);
    }

    function toUint80(uint256 value) internal pure returns (uint80) {
        if (value > type(uint80).max) {
            revert SafeCastOverflowedUintDowncast(80, value);
        }
        return uint80(value);
    }

    function toUint72(uint256 value) internal pure returns (uint72) {
        if (value > type(uint72).max) {
            revert SafeCastOverflowedUintDowncast(72, value);
        }
        return uint72(value);
    }

    function toUint64(uint256 value) internal pure returns (uint64) {
        if (value > type(uint64).max) {
            revert SafeCastOverflowedUintDowncast(64, value);
        }
        return uint64(value);
    }

    function toUint56(uint256 value) internal pure returns (uint56) {
        if (value > type(uint56).max) {
            revert SafeCastOverflowedUintDowncast(56, value);
        }
        return uint56(value);
    }

    function toUint48(uint256 value) internal pure returns (uint48) {
        if (value > type(uint48).max) {
            revert SafeCastOverflowedUintDowncast(48, value);
        }
        return uint48(value);
    }

    function toUint40(uint256 value) internal pure returns (uint40) {
        if (value > type(uint40).max) {
            revert SafeCastOverflowedUintDowncast(40, value);
        }
        return uint40(value);
    }

    function toUint32(uint256 value) internal pure returns (uint32) {
        if (value > type(uint32).max) {
            revert SafeCastOverflowedUintDowncast(32, value);
        }
        return uint32(value);
    }

    function toUint24(uint256 value) internal pure returns (uint24) {
        if (value > type(uint24).max) {
            revert SafeCastOverflowedUintDowncast(24, value);
        }
        return uint24(value);
    }

    function toUint16(uint256 value) internal pure returns (uint16) {
        if (value > type(uint16).max) {
            revert SafeCastOverflowedUintDowncast(16, value);
        }
        return uint16(value);
    }

    function toUint8(uint256 value) internal pure returns (uint8) {
        if (value > type(uint8).max) {
            revert SafeCastOverflowedUintDowncast(8, value);
        }
        return uint8(value);
    }

    function toUint256(int256 value) internal pure returns (uint256) {
        if (value < 0) {
            revert SafeCastOverflowedIntToUint(value);
        }
        return uint256(value);
    }

    function toInt248(int256 value) internal pure returns (int248 downcasted) {
        downcasted = int248(value);
        if (downcasted != value) {
            revert SafeCastOverflowedIntDowncast(248, value);
        }
    }

    function toInt240(int256 value) internal pure returns (int240 downcasted) {
        downcasted = int240(value);
        if (downcasted != value) {
            revert SafeCastOverflowedIntDowncast(240, value);
        }
    }

    function toInt232(int256 value) internal pure returns (int232 downcasted) {
        downcasted = int232(value);
        if (downcasted != value) {
            revert SafeCastOverflowedIntDowncast(232, value);
        }
    }

    function toInt224(int256 value) internal pure returns (int224 downcasted) {
        downcasted = int224(value);
        if (downcasted != value) {
            revert SafeCastOverflowedIntDowncast(224, value);
        }
    }

    function toInt216(int256 value) internal pure returns (int216 downcasted) {
        downcasted = int216(value);
        if (downcasted != value) {
            revert SafeCastOverflowedIntDowncast(216, value);
        }
    }

    function toInt208(int256 value) internal pure returns (int208 downcasted) {
        downcasted = int208(value);
        if (downcasted != value) {
            revert SafeCastOverflowedIntDowncast(208, value);
        }
    }

    function toInt200(int256 value) internal pure returns (int200 downcasted) {
        downcasted = int200(value);
        if (downcasted != value) {
            revert SafeCastOverflowedIntDowncast(200, value);
        }
    }

    function toInt192(int256 value) internal pure returns (int192 downcasted) {
        downcasted = int192(value);
        if (downcasted != value) {
            revert SafeCastOverflowedIntDowncast(192, value);
        }
    }

    function toInt184(int256 value) internal pure returns (int184 downcasted) {
        downcasted = int184(value);
        if (downcasted != value) {
            revert SafeCastOverflowedIntDowncast(184, value);
        }
    }

    function toInt176(int256 value) internal pure returns (int176 downcasted) {
        downcasted = int176(value);
        if (downcasted != value) {
            revert SafeCastOverflowedIntDowncast(176, value);
        }
    }

    function toInt168(int256 value) internal pure returns (int168 downcasted) {
        downcasted = int168(value);
        if (downcasted != value) {
            revert SafeCastOverflowedIntDowncast(168, value);
        }
    }

    function toInt160(int256 value) internal pure returns (int160 downcasted) {
        downcasted = int160(value);
        if (downcasted != value) {
            revert SafeCastOverflowedIntDowncast(160, value);
        }
    }

    function toInt152(int256 value) internal pure returns (int152 downcasted) {
        downcasted = int152(value);
        if (downcasted != value) {
            revert SafeCastOverflowedIntDowncast(152, value);
        }
    }

    function toInt144(int256 value) internal pure returns (int144 downcasted) {
        downcasted = int144(value);
        if (downcasted != value) {
            revert SafeCastOverflowedIntDowncast(144, value);
        }
    }

    function toInt136(int256 value) internal pure returns (int136 downcasted) {
        downcasted = int136(value);
        if (downcasted != value) {
            revert SafeCastOverflowedIntDowncast(136, value);
        }
    }

    function toInt128(int256 value) internal pure returns (int128 downcasted) {
        downcasted = int128(value);
        if (downcasted != value) {
            revert SafeCastOverflowedIntDowncast(128, value);
        }
    }

    function toInt120(int256 value) internal pure returns (int120 downcasted) {
        downcasted = int120(value);
        if (downcasted != value) {
            revert SafeCastOverflowedIntDowncast(120, value);
        }
    }

    function toInt112(int256 value) internal pure returns (int112 downcasted) {
        downcasted = int112(value);
        if (downcasted != value) {
            revert SafeCastOverflowedIntDowncast(112, value);
        }
    }

    function toInt104(int256 value) internal pure returns (int104 downcasted) {
        downcasted = int104(value);
        if (downcasted != value) {
            revert SafeCastOverflowedIntDowncast(104, value);
        }
    }

    function toInt96(int256 value) internal pure returns (int96 downcasted) {
        downcasted = int96(value);
        if (downcasted != value) {
            revert SafeCastOverflowedIntDowncast(96, value);
        }
    }

    function toInt88(int256 value) internal pure returns (int88 downcasted) {
        downcasted = int88(value);
        if (downcasted != value) {
            revert SafeCastOverflowedIntDowncast(88, value);
        }
    }

    function toInt80(int256 value) internal pure returns (int80 downcasted) {
        downcasted = int80(value);
        if (downcasted != value) {
            revert SafeCastOverflowedIntDowncast(80, value);
        }
    }

    function toInt72(int256 value) internal pure returns (int72 downcasted) {
        downcasted = int72(value);
        if (downcasted != value) {
            revert SafeCastOverflowedIntDowncast(72, value);
        }
    }

    function toInt64(int256 value) internal pure returns (int64 downcasted) {
        downcasted = int64(value);
        if (downcasted != value) {
            revert SafeCastOverflowedIntDowncast(64, value);
        }
    }

    function toInt56(int256 value) internal pure returns (int56 downcasted) {
        downcasted = int56(value);
        if (downcasted != value) {
            revert SafeCastOverflowedIntDowncast(56, value);
        }
    }

    function toInt48(int256 value) internal pure returns (int48 downcasted) {
        downcasted = int48(value);
        if (downcasted != value) {
            revert SafeCastOverflowedIntDowncast(48, value);
        }
    }

    function toInt40(int256 value) internal pure returns (int40 downcasted) {
        downcasted = int40(value);
        if (downcasted != value) {
            revert SafeCastOverflowedIntDowncast(40, value);
        }
    }

    function toInt32(int256 value) internal pure returns (int32 downcasted) {
        downcasted = int32(value);
        if (downcasted != value) {
            revert SafeCastOverflowedIntDowncast(32, value);
        }
    }

    function toInt24(int256 value) internal pure returns (int24 downcasted) {
        downcasted = int24(value);
        if (downcasted != value) {
            revert SafeCastOverflowedIntDowncast(24, value);
        }
    }

    function toInt16(int256 value) internal pure returns (int16 downcasted) {
        downcasted = int16(value);
        if (downcasted != value) {
            revert SafeCastOverflowedIntDowncast(16, value);
        }
    }

    function toInt8(int256 value) internal pure returns (int8 downcasted) {
        downcasted = int8(value);
        if (downcasted != value) {
            revert SafeCastOverflowedIntDowncast(8, value);
        }
    }

    function toInt256(uint256 value) internal pure returns (int256) {

        if (value > uint256(type(int256).max)) {
            revert SafeCastOverflowedUintToInt(value);
        }
        return int256(value);
    }

    function toUint(bool b) internal pure returns (uint256 u) {
        assembly ("memory-safe") {
            u := iszero(iszero(b))
        }
    }
}

interface IERC20Errors {

    error ERC20InsufficientBalance(address sender, uint256 balance, uint256 needed);

    error ERC20InvalidSender(address sender);

    error ERC20InvalidReceiver(address receiver);

    error ERC20InsufficientAllowance(address spender, uint256 allowance, uint256 needed);

    error ERC20InvalidApprover(address approver);

    error ERC20InvalidSpender(address spender);
}

interface IERC721Errors {

    error ERC721InvalidOwner(address owner);

    error ERC721NonexistentToken(uint256 tokenId);

    error ERC721IncorrectOwner(address sender, uint256 tokenId, address owner);

    error ERC721InvalidSender(address sender);

    error ERC721InvalidReceiver(address receiver);

    error ERC721InsufficientApproval(address operator, uint256 tokenId);

    error ERC721InvalidApprover(address approver);

    error ERC721InvalidOperator(address operator);
}

interface IERC1155Errors {

    error ERC1155InsufficientBalance(address sender, uint256 balance, uint256 needed, uint256 tokenId);

    error ERC1155InvalidSender(address sender);

    error ERC1155InvalidReceiver(address receiver);

    error ERC1155MissingApprovalForAll(address operator, address owner);

    error ERC1155InvalidApprover(address approver);

    error ERC1155InvalidOperator(address operator);

    error ERC1155InvalidArrayLength(uint256 idsLength, uint256 valuesLength);
}

abstract contract ERC165 is IERC165 {

    function supportsInterface(bytes4 interfaceId) public view virtual returns (bool) {
        return interfaceId == type(IERC165).interfaceId;
    }
}

interface IERC721 is IERC165 {

    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);

    event Approval(address indexed owner, address indexed approved, uint256 indexed tokenId);

    event ApprovalForAll(address indexed owner, address indexed operator, bool approved);

    function balanceOf(address owner) external view returns (uint256 balance);

    function ownerOf(uint256 tokenId) external view returns (address owner);

    function safeTransferFrom(address from, address to, uint256 tokenId, bytes calldata data) external;

    function safeTransferFrom(address from, address to, uint256 tokenId) external;

    function transferFrom(address from, address to, uint256 tokenId) external;

    function approve(address to, uint256 tokenId) external;

    function setApprovalForAll(address operator, bool approved) external;

    function getApproved(uint256 tokenId) external view returns (address operator);

    function isApprovedForAll(address owner, address operator) external view returns (bool);
}

abstract contract Ownable is Context {
    address private _owner;

    error OwnableUnauthorizedAccount(address account);

    error OwnableInvalidOwner(address owner);

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    constructor(address initialOwner) {
        if (initialOwner == address(0)) {
            revert OwnableInvalidOwner(address(0));
        }
        _transferOwnership(initialOwner);
    }

    modifier onlyOwner() {
        _checkOwner();
        _;
    }

    function owner() public view virtual returns (address) {
        return _owner;
    }

    function _checkOwner() internal view virtual {
        if (owner() != _msgSender()) {
            revert OwnableUnauthorizedAccount(_msgSender());
        }
    }

    function renounceOwnership() public virtual onlyOwner {
        _transferOwnership(address(0));
    }

    function transferOwnership(address newOwner) public virtual onlyOwner {
        if (newOwner == address(0)) {
            revert OwnableInvalidOwner(address(0));
        }
        _transferOwnership(newOwner);
    }

    function _transferOwnership(address newOwner) internal virtual {
        address oldOwner = _owner;
        _owner = newOwner;
        emit OwnershipTransferred(oldOwner, newOwner);
    }
}

library SignedMath {

    function ternary(bool condition, int256 a, int256 b) internal pure returns (int256) {
        unchecked {

            return b ^ ((a ^ b) * int256(SafeCast.toUint(condition)));
        }
    }

    function max(int256 a, int256 b) internal pure returns (int256) {
        return ternary(a > b, a, b);
    }

    function min(int256 a, int256 b) internal pure returns (int256) {
        return ternary(a < b, a, b);
    }

    function average(int256 a, int256 b) internal pure returns (int256) {

        int256 x = (a & b) + ((a ^ b) >> 1);
        return x + (int256(uint256(x) >> 255) & (a ^ b));
    }

    function abs(int256 n) internal pure returns (uint256) {
        unchecked {

            int256 mask = n >> 255;

            return uint256((n + mask) ^ mask);
        }
    }
}

library ERC721Utils {

    function checkOnERC721Received(
        address operator,
        address from,
        address to,
        uint256 tokenId,
        bytes memory data
    ) internal {
        if (to.code.length > 0) {
            try IERC721Receiver(to).onERC721Received(operator, from, tokenId, data) returns (bytes4 retval) {
                if (retval != IERC721Receiver.onERC721Received.selector) {

                    revert IERC721Errors.ERC721InvalidReceiver(to);
                }
            } catch (bytes memory reason) {
                if (reason.length == 0) {

                    revert IERC721Errors.ERC721InvalidReceiver(to);
                } else {
                    assembly ("memory-safe") {
                        revert(add(reason, 0x20), mload(reason))
                    }
                }
            }
        }
    }
}

interface IERC721Metadata is IERC721 {

    function name() external view returns (string memory);

    function symbol() external view returns (string memory);

    function tokenURI(uint256 tokenId) external view returns (string memory);
}

library Math {
    enum Rounding {
        Floor,
        Ceil,
        Trunc,
        Expand
    }

    function add512(uint256 a, uint256 b) internal pure returns (uint256 high, uint256 low) {
        assembly ("memory-safe") {
            low := add(a, b)
            high := lt(low, a)
        }
    }

    function mul512(uint256 a, uint256 b) internal pure returns (uint256 high, uint256 low) {

        assembly ("memory-safe") {
            let mm := mulmod(a, b, not(0))
            low := mul(a, b)
            high := sub(sub(mm, low), lt(mm, low))
        }
    }

    function tryAdd(uint256 a, uint256 b) internal pure returns (bool success, uint256 result) {
        unchecked {
            uint256 c = a + b;
            success = c >= a;
            result = c * SafeCast.toUint(success);
        }
    }

    function trySub(uint256 a, uint256 b) internal pure returns (bool success, uint256 result) {
        unchecked {
            uint256 c = a - b;
            success = c <= a;
            result = c * SafeCast.toUint(success);
        }
    }

    function tryMul(uint256 a, uint256 b) internal pure returns (bool success, uint256 result) {
        unchecked {
            uint256 c = a * b;
            assembly ("memory-safe") {

                success := or(eq(div(c, a), b), iszero(a))
            }

            result = c * SafeCast.toUint(success);
        }
    }

    function tryDiv(uint256 a, uint256 b) internal pure returns (bool success, uint256 result) {
        unchecked {
            success = b > 0;
            assembly ("memory-safe") {

                result := div(a, b)
            }
        }
    }

    function tryMod(uint256 a, uint256 b) internal pure returns (bool success, uint256 result) {
        unchecked {
            success = b > 0;
            assembly ("memory-safe") {

                result := mod(a, b)
            }
        }
    }

    function saturatingAdd(uint256 a, uint256 b) internal pure returns (uint256) {
        (bool success, uint256 result) = tryAdd(a, b);
        return ternary(success, result, type(uint256).max);
    }

    function saturatingSub(uint256 a, uint256 b) internal pure returns (uint256) {
        (, uint256 result) = trySub(a, b);
        return result;
    }

    function saturatingMul(uint256 a, uint256 b) internal pure returns (uint256) {
        (bool success, uint256 result) = tryMul(a, b);
        return ternary(success, result, type(uint256).max);
    }

    function ternary(bool condition, uint256 a, uint256 b) internal pure returns (uint256) {
        unchecked {

            return b ^ ((a ^ b) * SafeCast.toUint(condition));
        }
    }

    function max(uint256 a, uint256 b) internal pure returns (uint256) {
        return ternary(a > b, a, b);
    }

    function min(uint256 a, uint256 b) internal pure returns (uint256) {
        return ternary(a < b, a, b);
    }

    function average(uint256 a, uint256 b) internal pure returns (uint256) {
        unchecked {

            return (a & b) + (a ^ b) / 2;
        }
    }

    function ceilDiv(uint256 a, uint256 b) internal pure returns (uint256) {
        if (b == 0) {

            Panic.panic(Panic.DIVISION_BY_ZERO);
        }

        unchecked {
            return SafeCast.toUint(a > 0) * ((a - 1) / b + 1);
        }
    }

    function mulDiv(uint256 x, uint256 y, uint256 denominator) internal pure returns (uint256 result) {
        unchecked {
            (uint256 high, uint256 low) = mul512(x, y);

            if (high == 0) {

                return low / denominator;
            }

            if (denominator <= high) {
                Panic.panic(ternary(denominator == 0, Panic.DIVISION_BY_ZERO, Panic.UNDER_OVERFLOW));
            }

            uint256 remainder;
            assembly ("memory-safe") {

                remainder := mulmod(x, y, denominator)

                high := sub(high, gt(remainder, low))
                low := sub(low, remainder)
            }

            uint256 twos = denominator & (0 - denominator);
            assembly ("memory-safe") {

                denominator := div(denominator, twos)

                low := div(low, twos)

                twos := add(div(sub(0, twos), twos), 1)
            }

            low |= high * twos;

            uint256 inverse = (3 * denominator) ^ 2;

            inverse *= 2 - denominator * inverse;
            inverse *= 2 - denominator * inverse;
            inverse *= 2 - denominator * inverse;
            inverse *= 2 - denominator * inverse;
            inverse *= 2 - denominator * inverse;
            inverse *= 2 - denominator * inverse;

            result = low * inverse;
            return result;
        }
    }

    function mulDiv(uint256 x, uint256 y, uint256 denominator, Rounding rounding) internal pure returns (uint256) {
        return mulDiv(x, y, denominator) + SafeCast.toUint(unsignedRoundsUp(rounding) && mulmod(x, y, denominator) > 0);
    }

    function mulShr(uint256 x, uint256 y, uint8 n) internal pure returns (uint256 result) {
        unchecked {
            (uint256 high, uint256 low) = mul512(x, y);
            if (high >= 1 << n) {
                Panic.panic(Panic.UNDER_OVERFLOW);
            }
            return (high << (256 - n)) | (low >> n);
        }
    }

    function mulShr(uint256 x, uint256 y, uint8 n, Rounding rounding) internal pure returns (uint256) {
        return mulShr(x, y, n) + SafeCast.toUint(unsignedRoundsUp(rounding) && mulmod(x, y, 1 << n) > 0);
    }

    function invMod(uint256 a, uint256 n) internal pure returns (uint256) {
        unchecked {
            if (n == 0) return 0;

            uint256 remainder = a % n;
            uint256 gcd = n;

            int256 x = 0;
            int256 y = 1;

            while (remainder != 0) {
                uint256 quotient = gcd / remainder;

                (gcd, remainder) = (

                    remainder,

                    gcd - remainder * quotient
                );

                (x, y) = (

                    y,

                    x - y * int256(quotient)
                );
            }

            if (gcd != 1) return 0;
            return ternary(x < 0, n - uint256(-x), uint256(x));
        }
    }

    function invModPrime(uint256 a, uint256 p) internal view returns (uint256) {
        unchecked {
            return Math.modExp(a, p - 2, p);
        }
    }

    function modExp(uint256 b, uint256 e, uint256 m) internal view returns (uint256) {
        (bool success, uint256 result) = tryModExp(b, e, m);
        if (!success) {
            Panic.panic(Panic.DIVISION_BY_ZERO);
        }
        return result;
    }

    function tryModExp(uint256 b, uint256 e, uint256 m) internal view returns (bool success, uint256 result) {
        if (m == 0) return (false, 0);
        assembly ("memory-safe") {
            let ptr := mload(0x40)

            mstore(ptr, 0x20)
            mstore(add(ptr, 0x20), 0x20)
            mstore(add(ptr, 0x40), 0x20)
            mstore(add(ptr, 0x60), b)
            mstore(add(ptr, 0x80), e)
            mstore(add(ptr, 0xa0), m)

            success := staticcall(gas(), 0x05, ptr, 0xc0, 0x00, 0x20)
            result := mload(0x00)
        }
    }

    function modExp(bytes memory b, bytes memory e, bytes memory m) internal view returns (bytes memory) {
        (bool success, bytes memory result) = tryModExp(b, e, m);
        if (!success) {
            Panic.panic(Panic.DIVISION_BY_ZERO);
        }
        return result;
    }

    function tryModExp(
        bytes memory b,
        bytes memory e,
        bytes memory m
    ) internal view returns (bool success, bytes memory result) {
        if (_zeroBytes(m)) return (false, new bytes(0));

        uint256 mLen = m.length;

        result = abi.encodePacked(b.length, e.length, mLen, b, e, m);

        assembly ("memory-safe") {
            let dataPtr := add(result, 0x20)

            success := staticcall(gas(), 0x05, dataPtr, mload(result), dataPtr, mLen)

            mstore(result, mLen)

            mstore(0x40, add(dataPtr, mLen))
        }
    }

    function _zeroBytes(bytes memory buffer) private pure returns (bool) {
        uint256 chunk;
        for (uint256 i = 0; i < buffer.length; i += 0x20) {

            assembly ("memory-safe") {
                chunk := mload(add(add(buffer, 0x20), i))
            }
            if (chunk >> (8 * saturatingSub(i + 0x20, buffer.length)) != 0) {
                return false;
            }
        }
        return true;
    }

    function sqrt(uint256 a) internal pure returns (uint256) {
        unchecked {

            if (a <= 1) {
                return a;
            }

            uint256 aa = a;
            uint256 xn = 1;

            if (aa >= (1 << 128)) {
                aa >>= 128;
                xn <<= 64;
            }
            if (aa >= (1 << 64)) {
                aa >>= 64;
                xn <<= 32;
            }
            if (aa >= (1 << 32)) {
                aa >>= 32;
                xn <<= 16;
            }
            if (aa >= (1 << 16)) {
                aa >>= 16;
                xn <<= 8;
            }
            if (aa >= (1 << 8)) {
                aa >>= 8;
                xn <<= 4;
            }
            if (aa >= (1 << 4)) {
                aa >>= 4;
                xn <<= 2;
            }
            if (aa >= (1 << 2)) {
                xn <<= 1;
            }

            xn = (3 * xn) >> 1;

            xn = (xn + a / xn) >> 1;
            xn = (xn + a / xn) >> 1;
            xn = (xn + a / xn) >> 1;
            xn = (xn + a / xn) >> 1;
            xn = (xn + a / xn) >> 1;
            xn = (xn + a / xn) >> 1;

            return xn - SafeCast.toUint(xn > a / xn);
        }
    }

    function sqrt(uint256 a, Rounding rounding) internal pure returns (uint256) {
        unchecked {
            uint256 result = sqrt(a);
            return result + SafeCast.toUint(unsignedRoundsUp(rounding) && result * result < a);
        }
    }

    function log2(uint256 x) internal pure returns (uint256 r) {

        r = SafeCast.toUint(x > 0xffffffffffffffffffffffffffffffff) << 7;

        r |= SafeCast.toUint((x >> r) > 0xffffffffffffffff) << 6;

        r |= SafeCast.toUint((x >> r) > 0xffffffff) << 5;

        r |= SafeCast.toUint((x >> r) > 0xffff) << 4;

        r |= SafeCast.toUint((x >> r) > 0xff) << 3;

        r |= SafeCast.toUint((x >> r) > 0xf) << 2;

        assembly ("memory-safe") {
            r := or(r, byte(shr(r, x), 0x0000010102020202030303030303030300000000000000000000000000000000))
        }
    }

    function log2(uint256 value, Rounding rounding) internal pure returns (uint256) {
        unchecked {
            uint256 result = log2(value);
            return result + SafeCast.toUint(unsignedRoundsUp(rounding) && 1 << result < value);
        }
    }

    function log10(uint256 value) internal pure returns (uint256) {
        uint256 result = 0;
        unchecked {
            if (value >= 10 ** 64) {
                value /= 10 ** 64;
                result += 64;
            }
            if (value >= 10 ** 32) {
                value /= 10 ** 32;
                result += 32;
            }
            if (value >= 10 ** 16) {
                value /= 10 ** 16;
                result += 16;
            }
            if (value >= 10 ** 8) {
                value /= 10 ** 8;
                result += 8;
            }
            if (value >= 10 ** 4) {
                value /= 10 ** 4;
                result += 4;
            }
            if (value >= 10 ** 2) {
                value /= 10 ** 2;
                result += 2;
            }
            if (value >= 10 ** 1) {
                result += 1;
            }
        }
        return result;
    }

    function log10(uint256 value, Rounding rounding) internal pure returns (uint256) {
        unchecked {
            uint256 result = log10(value);
            return result + SafeCast.toUint(unsignedRoundsUp(rounding) && 10 ** result < value);
        }
    }

    function log256(uint256 x) internal pure returns (uint256 r) {

        r = SafeCast.toUint(x > 0xffffffffffffffffffffffffffffffff) << 7;

        r |= SafeCast.toUint((x >> r) > 0xffffffffffffffff) << 6;

        r |= SafeCast.toUint((x >> r) > 0xffffffff) << 5;

        r |= SafeCast.toUint((x >> r) > 0xffff) << 4;

        return (r >> 3) | SafeCast.toUint((x >> r) > 0xff);
    }

    function log256(uint256 value, Rounding rounding) internal pure returns (uint256) {
        unchecked {
            uint256 result = log256(value);
            return result + SafeCast.toUint(unsignedRoundsUp(rounding) && 1 << (result << 3) < value);
        }
    }

    function unsignedRoundsUp(Rounding rounding) internal pure returns (bool) {
        return uint8(rounding) % 2 == 1;
    }

    function clz(uint256 x) internal pure returns (uint256) {
        return ternary(x == 0, 256, 255 - log2(x));
    }
}

library Bytes {

    function indexOf(bytes memory buffer, bytes1 s) internal pure returns (uint256) {
        return indexOf(buffer, s, 0);
    }

    function indexOf(bytes memory buffer, bytes1 s, uint256 pos) internal pure returns (uint256) {
        uint256 length = buffer.length;
        for (uint256 i = pos; i < length; ++i) {
            if (bytes1(_unsafeReadBytesOffset(buffer, i)) == s) {
                return i;
            }
        }
        return type(uint256).max;
    }

    function lastIndexOf(bytes memory buffer, bytes1 s) internal pure returns (uint256) {
        return lastIndexOf(buffer, s, type(uint256).max);
    }

    function lastIndexOf(bytes memory buffer, bytes1 s, uint256 pos) internal pure returns (uint256) {
        unchecked {
            uint256 length = buffer.length;
            for (uint256 i = Math.min(Math.saturatingAdd(pos, 1), length); i > 0; --i) {
                if (bytes1(_unsafeReadBytesOffset(buffer, i - 1)) == s) {
                    return i - 1;
                }
            }
            return type(uint256).max;
        }
    }

    function slice(bytes memory buffer, uint256 start) internal pure returns (bytes memory) {
        return slice(buffer, start, buffer.length);
    }

    function slice(bytes memory buffer, uint256 start, uint256 end) internal pure returns (bytes memory) {

        end = Math.min(end, buffer.length);
        start = Math.min(start, end);

        bytes memory result = new bytes(end - start);
        assembly ("memory-safe") {
            mcopy(add(result, 0x20), add(add(buffer, 0x20), start), sub(end, start))
        }

        return result;
    }

    function splice(bytes memory buffer, uint256 start) internal pure returns (bytes memory) {
        return splice(buffer, start, buffer.length);
    }

    function splice(bytes memory buffer, uint256 start, uint256 end) internal pure returns (bytes memory) {

        end = Math.min(end, buffer.length);
        start = Math.min(start, end);

        assembly ("memory-safe") {
            mcopy(add(buffer, 0x20), add(add(buffer, 0x20), start), sub(end, start))
            mstore(buffer, sub(end, start))
        }

        return buffer;
    }

    function replace(bytes memory buffer, uint256 pos, bytes memory replacement) internal pure returns (bytes memory) {
        return replace(buffer, pos, replacement, 0, replacement.length);
    }

    function replace(
        bytes memory buffer,
        uint256 pos,
        bytes memory replacement,
        uint256 offset,
        uint256 length
    ) internal pure returns (bytes memory) {

        pos = Math.min(pos, buffer.length);
        offset = Math.min(offset, replacement.length);
        length = Math.min(length, Math.min(replacement.length - offset, buffer.length - pos));

        assembly ("memory-safe") {
            mcopy(add(add(buffer, 0x20), pos), add(add(replacement, 0x20), offset), length)
        }

        return buffer;
    }

    function concat(bytes[] memory buffers) internal pure returns (bytes memory) {
        uint256 length = 0;
        for (uint256 i = 0; i < buffers.length; ++i) {
            length += buffers[i].length;
        }

        bytes memory result = new bytes(length);

        uint256 offset = 0x20;
        for (uint256 i = 0; i < buffers.length; ++i) {
            bytes memory input = buffers[i];
            assembly ("memory-safe") {
                mcopy(add(result, offset), add(input, 0x20), mload(input))
            }
            unchecked {
                offset += input.length;
            }
        }

        return result;
    }

    function toNibbles(bytes memory input) internal pure returns (bytes memory output) {
        assembly ("memory-safe") {
            let length := mload(input)
            output := mload(0x40)
            mstore(0x40, add(add(output, 0x20), mul(length, 2)))
            mstore(output, mul(length, 2))
            for {
                let i := 0
            } lt(i, length) {
                i := add(i, 0x10)
            } {
                let chunk := shr(128, mload(add(add(input, 0x20), i)))
                chunk := and(
                    0x0000000000000000ffffffffffffffff0000000000000000ffffffffffffffff,
                    or(shl(64, chunk), chunk)
                )
                chunk := and(
                    0x00000000ffffffff00000000ffffffff00000000ffffffff00000000ffffffff,
                    or(shl(32, chunk), chunk)
                )
                chunk := and(
                    0x0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff,
                    or(shl(16, chunk), chunk)
                )
                chunk := and(
                    0x00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff,
                    or(shl(8, chunk), chunk)
                )
                chunk := and(
                    0x0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f,
                    or(shl(4, chunk), chunk)
                )
                mstore(add(add(output, 0x20), mul(i, 2)), chunk)
            }
        }
    }

    function equal(bytes memory a, bytes memory b) internal pure returns (bool) {
        return a.length == b.length && keccak256(a) == keccak256(b);
    }

    function reverseBytes32(bytes32 value) internal pure returns (bytes32) {
        value =
            ((value >> 8) & 0x00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF) |
            ((value & 0x00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF) << 8);
        value =
            ((value >> 16) & 0x0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF) |
            ((value & 0x0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF) << 16);
        value =
            ((value >> 32) & 0x00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF) |
            ((value & 0x00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF) << 32);
        value =
            ((value >> 64) & 0x0000000000000000FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF) |
            ((value & 0x0000000000000000FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF) << 64);
        return (value >> 128) | (value << 128);
    }

    function reverseBytes16(bytes16 value) internal pure returns (bytes16) {
        value =
            ((value & 0xFF00FF00FF00FF00FF00FF00FF00FF00) >> 8) | ((value & 0x00FF00FF00FF00FF00FF00FF00FF00FF) << 8);
        value =
            ((value & 0xFFFF0000FFFF0000FFFF0000FFFF0000) >> 16) | ((value & 0x0000FFFF0000FFFF0000FFFF0000FFFF) << 16);
        value =
            ((value & 0xFFFFFFFF00000000FFFFFFFF00000000) >> 32) | ((value & 0x00000000FFFFFFFF00000000FFFFFFFF) << 32);
        return (value >> 64) | (value << 64);
    }

    function reverseBytes8(bytes8 value) internal pure returns (bytes8) {
        value = ((value & 0xFF00FF00FF00FF00) >> 8) | ((value & 0x00FF00FF00FF00FF) << 8);
        value = ((value & 0xFFFF0000FFFF0000) >> 16) | ((value & 0x0000FFFF0000FFFF) << 16);
        return (value >> 32) | (value << 32);
    }

    function reverseBytes4(bytes4 value) internal pure returns (bytes4) {
        value = ((value & 0xFF00FF00) >> 8) | ((value & 0x00FF00FF) << 8);
        return (value >> 16) | (value << 16);
    }

    function reverseBytes2(bytes2 value) internal pure returns (bytes2) {
        return (value >> 8) | (value << 8);
    }

    function clz(bytes memory buffer) internal pure returns (uint256) {
        for (uint256 i = 0; i < buffer.length; i += 0x20) {
            bytes32 chunk = _unsafeReadBytesOffset(buffer, i);
            if (chunk != bytes32(0)) {
                return Math.min(8 * i + Math.clz(uint256(chunk)), 8 * buffer.length);
            }
        }
        return 8 * buffer.length;
    }

    function _unsafeReadBytesOffset(bytes memory buffer, uint256 offset) private pure returns (bytes32 value) {

        assembly ("memory-safe") {
            value := mload(add(add(buffer, 0x20), offset))
        }
    }
}

library Strings {
    using SafeCast for *;

    bytes16 private constant HEX_DIGITS = "0123456789abcdef";
    uint8 private constant ADDRESS_LENGTH = 20;
    uint256 private constant SPECIAL_CHARS_LOOKUP =
        0xffffffff |
            (1 << 0x22) |
            (1 << 0x5c);

    error StringsInsufficientHexLength(uint256 value, uint256 length);

    error StringsInvalidChar();

    error StringsInvalidAddressFormat();

    function toString(uint256 value) internal pure returns (string memory) {
        unchecked {
            uint256 length = Math.log10(value) + 1;
            string memory buffer = new string(length);
            uint256 ptr;
            assembly ("memory-safe") {
                ptr := add(add(buffer, 0x20), length)
            }
            while (true) {
                ptr--;
                assembly ("memory-safe") {
                    mstore8(ptr, byte(mod(value, 10), HEX_DIGITS))
                }
                value /= 10;
                if (value == 0) break;
            }
            return buffer;
        }
    }

    function toStringSigned(int256 value) internal pure returns (string memory) {
        return string.concat(value < 0 ? "-" : "", toString(SignedMath.abs(value)));
    }

    function toHexString(uint256 value) internal pure returns (string memory) {
        unchecked {
            return toHexString(value, Math.log256(value) + 1);
        }
    }

    function toHexString(uint256 value, uint256 length) internal pure returns (string memory) {
        uint256 localValue = value;
        bytes memory buffer = new bytes(2 * length + 2);
        buffer[0] = "0";
        buffer[1] = "x";
        for (uint256 i = 2 * length + 1; i > 1; --i) {
            buffer[i] = HEX_DIGITS[localValue & 0xf];
            localValue >>= 4;
        }
        if (localValue != 0) {
            revert StringsInsufficientHexLength(value, length);
        }
        return string(buffer);
    }

    function toHexString(address addr) internal pure returns (string memory) {
        return toHexString(uint256(uint160(addr)), ADDRESS_LENGTH);
    }

    function toChecksumHexString(address addr) internal pure returns (string memory) {
        bytes memory buffer = bytes(toHexString(addr));

        uint256 hashValue;
        assembly ("memory-safe") {
            hashValue := shr(96, keccak256(add(buffer, 0x22), 40))
        }

        for (uint256 i = 41; i > 1; --i) {

            if (hashValue & 0xf > 7 && uint8(buffer[i]) > 96) {

                buffer[i] ^= 0x20;
            }
            hashValue >>= 4;
        }
        return string(buffer);
    }

    function toHexString(bytes memory input) internal pure returns (string memory) {
        unchecked {
            bytes memory buffer = new bytes(2 * input.length + 2);
            buffer[0] = "0";
            buffer[1] = "x";
            for (uint256 i = 0; i < input.length; ++i) {
                uint8 v = uint8(input[i]);
                buffer[2 * i + 2] = HEX_DIGITS[v >> 4];
                buffer[2 * i + 3] = HEX_DIGITS[v & 0xf];
            }
            return string(buffer);
        }
    }

    function equal(string memory a, string memory b) internal pure returns (bool) {
        return Bytes.equal(bytes(a), bytes(b));
    }

    function parseUint(string memory input) internal pure returns (uint256) {
        return parseUint(input, 0, bytes(input).length);
    }

    function parseUint(string memory input, uint256 begin, uint256 end) internal pure returns (uint256) {
        (bool success, uint256 value) = tryParseUint(input, begin, end);
        if (!success) revert StringsInvalidChar();
        return value;
    }

    function tryParseUint(string memory input) internal pure returns (bool success, uint256 value) {
        return _tryParseUintUncheckedBounds(input, 0, bytes(input).length);
    }

    function tryParseUint(
        string memory input,
        uint256 begin,
        uint256 end
    ) internal pure returns (bool success, uint256 value) {
        if (end > bytes(input).length || begin > end) return (false, 0);
        return _tryParseUintUncheckedBounds(input, begin, end);
    }

    function _tryParseUintUncheckedBounds(
        string memory input,
        uint256 begin,
        uint256 end
    ) private pure returns (bool success, uint256 value) {
        bytes memory buffer = bytes(input);

        uint256 result = 0;
        for (uint256 i = begin; i < end; ++i) {
            uint8 chr = _tryParseChr(bytes1(_unsafeReadBytesOffset(buffer, i)));
            if (chr > 9) return (false, 0);
            result *= 10;
            result += chr;
        }
        return (true, result);
    }

    function parseInt(string memory input) internal pure returns (int256) {
        return parseInt(input, 0, bytes(input).length);
    }

    function parseInt(string memory input, uint256 begin, uint256 end) internal pure returns (int256) {
        (bool success, int256 value) = tryParseInt(input, begin, end);
        if (!success) revert StringsInvalidChar();
        return value;
    }

    function tryParseInt(string memory input) internal pure returns (bool success, int256 value) {
        return _tryParseIntUncheckedBounds(input, 0, bytes(input).length);
    }

    uint256 private constant ABS_MIN_INT256 = 2 ** 255;

    function tryParseInt(
        string memory input,
        uint256 begin,
        uint256 end
    ) internal pure returns (bool success, int256 value) {
        if (end > bytes(input).length || begin > end) return (false, 0);
        return _tryParseIntUncheckedBounds(input, begin, end);
    }

    function _tryParseIntUncheckedBounds(
        string memory input,
        uint256 begin,
        uint256 end
    ) private pure returns (bool success, int256 value) {
        bytes memory buffer = bytes(input);

        bytes1 sign = begin == end ? bytes1(0) : bytes1(_unsafeReadBytesOffset(buffer, begin));
        bool positiveSign = sign == bytes1("+");
        bool negativeSign = sign == bytes1("-");
        uint256 offset = (positiveSign || negativeSign).toUint();

        (bool absSuccess, uint256 absValue) = tryParseUint(input, begin + offset, end);

        if (absSuccess && absValue < ABS_MIN_INT256) {
            return (true, negativeSign ? -int256(absValue) : int256(absValue));
        } else if (absSuccess && negativeSign && absValue == ABS_MIN_INT256) {
            return (true, type(int256).min);
        } else return (false, 0);
    }

    function parseHexUint(string memory input) internal pure returns (uint256) {
        return parseHexUint(input, 0, bytes(input).length);
    }

    function parseHexUint(string memory input, uint256 begin, uint256 end) internal pure returns (uint256) {
        (bool success, uint256 value) = tryParseHexUint(input, begin, end);
        if (!success) revert StringsInvalidChar();
        return value;
    }

    function tryParseHexUint(string memory input) internal pure returns (bool success, uint256 value) {
        return _tryParseHexUintUncheckedBounds(input, 0, bytes(input).length);
    }

    function tryParseHexUint(
        string memory input,
        uint256 begin,
        uint256 end
    ) internal pure returns (bool success, uint256 value) {
        if (end > bytes(input).length || begin > end) return (false, 0);
        return _tryParseHexUintUncheckedBounds(input, begin, end);
    }

    function _tryParseHexUintUncheckedBounds(
        string memory input,
        uint256 begin,
        uint256 end
    ) private pure returns (bool success, uint256 value) {
        bytes memory buffer = bytes(input);

        bool hasPrefix = (end > begin + 1) && bytes2(_unsafeReadBytesOffset(buffer, begin)) == bytes2("0x");
        uint256 offset = hasPrefix.toUint() * 2;

        uint256 result = 0;
        for (uint256 i = begin + offset; i < end; ++i) {
            uint8 chr = _tryParseChr(bytes1(_unsafeReadBytesOffset(buffer, i)));
            if (chr > 15) return (false, 0);
            result *= 16;
            unchecked {

                result += chr;
            }
        }
        return (true, result);
    }

    function parseAddress(string memory input) internal pure returns (address) {
        return parseAddress(input, 0, bytes(input).length);
    }

    function parseAddress(string memory input, uint256 begin, uint256 end) internal pure returns (address) {
        (bool success, address value) = tryParseAddress(input, begin, end);
        if (!success) revert StringsInvalidAddressFormat();
        return value;
    }

    function tryParseAddress(string memory input) internal pure returns (bool success, address value) {
        return tryParseAddress(input, 0, bytes(input).length);
    }

    function tryParseAddress(
        string memory input,
        uint256 begin,
        uint256 end
    ) internal pure returns (bool success, address value) {
        if (end > bytes(input).length || begin > end) return (false, address(0));

        bool hasPrefix = (end > begin + 1) && bytes2(_unsafeReadBytesOffset(bytes(input), begin)) == bytes2("0x");
        uint256 expectedLength = 40 + hasPrefix.toUint() * 2;

        if (end - begin == expectedLength) {

            (bool s, uint256 v) = _tryParseHexUintUncheckedBounds(input, begin, end);
            return (s, address(uint160(v)));
        } else {
            return (false, address(0));
        }
    }

    function _tryParseChr(bytes1 chr) private pure returns (uint8) {
        uint8 value = uint8(chr);

        unchecked {
            if (value > 47 && value < 58) value -= 48;
            else if (value > 96 && value < 103) value -= 87;
            else if (value > 64 && value < 71) value -= 55;
            else return type(uint8).max;
        }

        return value;
    }

    function escapeJSON(string memory input) internal pure returns (string memory) {
        bytes memory buffer = bytes(input);

        bytes memory output;
        assembly ("memory-safe") {
            output := mload(0x40)
        }
        uint256 outputLength = 0;

        for (uint256 i = 0; i < buffer.length; ++i) {
            uint8 char = uint8(bytes1(_unsafeReadBytesOffset(buffer, i)));
            if (((SPECIAL_CHARS_LOOKUP & (1 << char)) != 0)) {
                _unsafeWriteBytesOffset(output, outputLength++, "\\");
                if (char == 0x08) _unsafeWriteBytesOffset(output, outputLength++, "b");
                else if (char == 0x09) _unsafeWriteBytesOffset(output, outputLength++, "t");
                else if (char == 0x0a) _unsafeWriteBytesOffset(output, outputLength++, "n");
                else if (char == 0x0c) _unsafeWriteBytesOffset(output, outputLength++, "f");
                else if (char == 0x0d) _unsafeWriteBytesOffset(output, outputLength++, "r");
                else if (char == 0x5c) _unsafeWriteBytesOffset(output, outputLength++, "\\");
                else if (char == 0x22) {

                    _unsafeWriteBytesOffset(output, outputLength++, '"');
                } else {

                    _unsafeWriteBytesOffset(output, outputLength++, "u");
                    _unsafeWriteBytesOffset(output, outputLength++, "0");
                    _unsafeWriteBytesOffset(output, outputLength++, "0");
                    _unsafeWriteBytesOffset(output, outputLength++, HEX_DIGITS[char >> 4]);
                    _unsafeWriteBytesOffset(output, outputLength++, HEX_DIGITS[char & 0x0f]);
                }
            } else {
                _unsafeWriteBytesOffset(output, outputLength++, bytes1(char));
            }
        }

        assembly ("memory-safe") {
            mstore(output, outputLength)
            mstore(0x40, add(output, add(outputLength, 0x20)))
        }

        return string(output);
    }

    function _unsafeReadBytesOffset(bytes memory buffer, uint256 offset) private pure returns (bytes32 value) {

        assembly ("memory-safe") {
            value := mload(add(add(buffer, 0x20), offset))
        }
    }

    function _unsafeWriteBytesOffset(bytes memory buffer, uint256 offset, bytes1 value) private pure {

        assembly ("memory-safe") {
            mstore8(add(add(buffer, 0x20), offset), shr(248, value))
        }
    }
}

abstract contract ERC721 is Context, ERC165, IERC721, IERC721Metadata, IERC721Errors {
    using Strings for uint256;

    string private _name;

    string private _symbol;

    mapping(uint256 tokenId => address) private _owners;

    mapping(address owner => uint256) private _balances;

    mapping(uint256 tokenId => address) private _tokenApprovals;

    mapping(address owner => mapping(address operator => bool)) private _operatorApprovals;

    constructor(string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
    }

    function supportsInterface(bytes4 interfaceId) public view virtual override(ERC165, IERC165) returns (bool) {
        return
            interfaceId == type(IERC721).interfaceId ||
            interfaceId == type(IERC721Metadata).interfaceId ||
            super.supportsInterface(interfaceId);
    }

    function balanceOf(address owner) public view virtual returns (uint256) {
        if (owner == address(0)) {
            revert ERC721InvalidOwner(address(0));
        }
        return _balances[owner];
    }

    function ownerOf(uint256 tokenId) public view virtual returns (address) {
        return _requireOwned(tokenId);
    }

    function name() public view virtual returns (string memory) {
        return _name;
    }

    function symbol() public view virtual returns (string memory) {
        return _symbol;
    }

    function tokenURI(uint256 tokenId) public view virtual returns (string memory) {
        _requireOwned(tokenId);

        string memory baseURI = _baseURI();
        return bytes(baseURI).length > 0 ? string.concat(baseURI, tokenId.toString()) : "";
    }

    function _baseURI() internal view virtual returns (string memory) {
        return "";
    }

    function approve(address to, uint256 tokenId) public virtual {
        _approve(to, tokenId, _msgSender());
    }

    function getApproved(uint256 tokenId) public view virtual returns (address) {
        _requireOwned(tokenId);

        return _getApproved(tokenId);
    }

    function setApprovalForAll(address operator, bool approved) public virtual {
        _setApprovalForAll(_msgSender(), operator, approved);
    }

    function isApprovedForAll(address owner, address operator) public view virtual returns (bool) {
        return _operatorApprovals[owner][operator];
    }

    function transferFrom(address from, address to, uint256 tokenId) public virtual {
        if (to == address(0)) {
            revert ERC721InvalidReceiver(address(0));
        }

        address previousOwner = _update(to, tokenId, _msgSender());
        if (previousOwner != from) {
            revert ERC721IncorrectOwner(from, tokenId, previousOwner);
        }
    }

    function safeTransferFrom(address from, address to, uint256 tokenId) public {
        safeTransferFrom(from, to, tokenId, "");
    }

    function safeTransferFrom(address from, address to, uint256 tokenId, bytes memory data) public virtual {
        transferFrom(from, to, tokenId);
        ERC721Utils.checkOnERC721Received(_msgSender(), from, to, tokenId, data);
    }

    function _ownerOf(uint256 tokenId) internal view virtual returns (address) {
        return _owners[tokenId];
    }

    function _getApproved(uint256 tokenId) internal view virtual returns (address) {
        return _tokenApprovals[tokenId];
    }

    function _isAuthorized(address owner, address spender, uint256 tokenId) internal view virtual returns (bool) {
        return
            spender != address(0) &&
            (owner == spender || isApprovedForAll(owner, spender) || _getApproved(tokenId) == spender);
    }

    function _checkAuthorized(address owner, address spender, uint256 tokenId) internal view virtual {
        if (!_isAuthorized(owner, spender, tokenId)) {
            if (owner == address(0)) {
                revert ERC721NonexistentToken(tokenId);
            } else {
                revert ERC721InsufficientApproval(spender, tokenId);
            }
        }
    }

    function _increaseBalance(address account, uint128 value) internal virtual {
        unchecked {
            _balances[account] += value;
        }
    }

    function _update(address to, uint256 tokenId, address auth) internal virtual returns (address) {
        address from = _ownerOf(tokenId);

        if (auth != address(0)) {
            _checkAuthorized(from, auth, tokenId);
        }

        if (from != address(0)) {

            _approve(address(0), tokenId, address(0), false);

            unchecked {
                _balances[from] -= 1;
            }
        }

        if (to != address(0)) {
            unchecked {
                _balances[to] += 1;
            }
        }

        _owners[tokenId] = to;

        emit Transfer(from, to, tokenId);

        return from;
    }

    function _mint(address to, uint256 tokenId) internal {
        if (to == address(0)) {
            revert ERC721InvalidReceiver(address(0));
        }
        address previousOwner = _update(to, tokenId, address(0));
        if (previousOwner != address(0)) {
            revert ERC721InvalidSender(address(0));
        }
    }

    function _safeMint(address to, uint256 tokenId) internal {
        _safeMint(to, tokenId, "");
    }

    function _safeMint(address to, uint256 tokenId, bytes memory data) internal virtual {
        _mint(to, tokenId);
        ERC721Utils.checkOnERC721Received(_msgSender(), address(0), to, tokenId, data);
    }

    function _burn(uint256 tokenId) internal {
        address previousOwner = _update(address(0), tokenId, address(0));
        if (previousOwner == address(0)) {
            revert ERC721NonexistentToken(tokenId);
        }
    }

    function _transfer(address from, address to, uint256 tokenId) internal {
        if (to == address(0)) {
            revert ERC721InvalidReceiver(address(0));
        }
        address previousOwner = _update(to, tokenId, address(0));
        if (previousOwner == address(0)) {
            revert ERC721NonexistentToken(tokenId);
        } else if (previousOwner != from) {
            revert ERC721IncorrectOwner(from, tokenId, previousOwner);
        }
    }

    function _safeTransfer(address from, address to, uint256 tokenId) internal {
        _safeTransfer(from, to, tokenId, "");
    }

    function _safeTransfer(address from, address to, uint256 tokenId, bytes memory data) internal virtual {
        _transfer(from, to, tokenId);
        ERC721Utils.checkOnERC721Received(_msgSender(), from, to, tokenId, data);
    }

    function _approve(address to, uint256 tokenId, address auth) internal {
        _approve(to, tokenId, auth, true);
    }

    function _approve(address to, uint256 tokenId, address auth, bool emitEvent) internal virtual {

        if (emitEvent || auth != address(0)) {
            address owner = _requireOwned(tokenId);

            if (auth != address(0) && owner != auth && !isApprovedForAll(owner, auth)) {
                revert ERC721InvalidApprover(auth);
            }

            if (emitEvent) {
                emit Approval(owner, to, tokenId);
            }
        }

        _tokenApprovals[tokenId] = to;
    }

    function _setApprovalForAll(address owner, address operator, bool approved) internal virtual {
        if (owner == address(0)) {
            revert ERC721InvalidApprover(address(0));
        }
        if (operator == address(0)) {
            revert ERC721InvalidOperator(operator);
        }
        _operatorApprovals[owner][operator] = approved;
        emit ApprovalForAll(owner, operator, approved);
    }

    function _requireOwned(uint256 tokenId) internal view returns (address) {
        address owner = _ownerOf(tokenId);
        if (owner == address(0)) {
            revert ERC721NonexistentToken(tokenId);
        }
        return owner;
    }
}

contract OnchainNFT is ERC721, Ownable {
    uint256 private _nextTokenId;

    struct ContractData {
        address rawContract;
        uint128 size;
        uint128 offset;
    }

    struct ContractDataPages {
        uint256 maxPageNumber;
        bool exists;
        mapping(uint256 => ContractData) pages;
    }

    mapping(string => ContractDataPages) internal _contractDataPages;

    event DataSaved(string indexed key, uint128 indexed pageNumber, address indexed dataContract, uint128 size);
    event DataRevoked(string indexed key);
    event NFTMinted(address indexed to, uint256 indexed tokenId);

    constructor(
        string memory name_,
        string memory symbol_,
        address initialOwner
    ) ERC721(name_, symbol_) Ownable(initialOwner) {}

    function saveData(
        string memory _key,
        uint128 _pageNumber,
        bytes memory _b
    ) public onlyOwner {
        require(
            _b.length < 24576,
            "OnchainNFT: Exceeded 24,576 bytes max contract size"
        );

        bytes memory init = hex"610000_600e_6000_39_610000_6000_f3";
        bytes1 size1 = bytes1(uint8(_b.length));
        bytes1 size2 = bytes1(uint8(_b.length >> 8));
        init[2] = size1;
        init[1] = size2;
        init[10] = size1;
        init[9] = size2;

        bytes memory code = abi.encodePacked(init, _b);

        address dataContract;
        assembly {
            dataContract := create(0, add(code, 32), mload(code))
            if eq(dataContract, 0) {
                returndatacopy(0, 0, returndatasize())
                revert(0, returndatasize())
            }
        }

        saveDataForDeployedContract(
            _key,
            _pageNumber,
            dataContract,
            uint128(_b.length),
            0
        );

        emit DataSaved(_key, _pageNumber, dataContract, uint128(_b.length));
    }

    function saveDataForDeployedContract(
        string memory _key,
        uint256 _pageNumber,
        address dataContract,
        uint128 _size,
        uint128 _offset
    ) internal {
        ContractDataPages storage _cdPages = _contractDataPages[_key];

        if (_cdPages.maxPageNumber < _pageNumber) {
            _cdPages.maxPageNumber = _pageNumber;
        }

        _cdPages.exists = true;
        _cdPages.pages[_pageNumber] = ContractData(
            dataContract,
            _size,
            _offset
        );
    }

    function revokeContractData(string memory _key) public onlyOwner {
        delete _contractDataPages[_key];
        emit DataRevoked(_key);
    }

    function getSizeOfPages(string memory _key) public view returns (uint256) {
        ContractDataPages storage _cdPages = _contractDataPages[_key];
        if (!_cdPages.exists) return 0;

        uint256 totalSize;
        for (uint256 idx; idx <= _cdPages.maxPageNumber; idx++) {
            totalSize += _cdPages.pages[idx].size;
        }
        return totalSize;
    }

    function getData(string memory _key) public view returns (bytes memory) {
        uint256 totalSize = getSizeOfPages(_key);
        if (totalSize == 0) return new bytes(0);

        bytes memory _totalData = new bytes(totalSize);
        ContractDataPages storage _cdPages = _contractDataPages[_key];

        uint256 currentPointer = 32;
        for (uint256 idx; idx <= _cdPages.maxPageNumber; idx++) {
            ContractData storage dataPage = _cdPages.pages[idx];
            address dataContract = dataPage.rawContract;
            uint256 size = uint256(dataPage.size);
            uint256 offset = uint256(dataPage.offset);

            assembly {
                extcodecopy(
                    dataContract,
                    add(_totalData, currentPointer),
                    offset,
                    size
                )
            }
            currentPointer += size;
        }

        return _totalData;
    }

    function hasKey(string memory _key) public view returns (bool) {
        return _contractDataPages[_key].exists;
    }

    function mint(address to) public onlyOwner returns (uint256 tokenId) {
        tokenId = _nextTokenId++;
        _safeMint(to, tokenId);
        emit NFTMinted(to, tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override
        returns (string memory)
    {
        _requireOwned(tokenId);
        return genMetadata();
    }

    function genMetadata() public view returns (string memory) {
        bytes memory metadataBytes = getData("metadata");
        if (metadataBytes.length == 0) {
            metadataBytes = getData("dan");
        }
        require(metadataBytes.length > 0, "OnchainNFT: No metadata uploaded");

        if (metadataBytes[0] == 0x7b || metadataBytes[0] == 0x20) {
            return string(abi.encodePacked("data:application/json;utf8,", metadataBytes));
        }

        return string(abi.encodePacked("data:application/json;base64,", metadataBytes));
    }

    function genRawImage() public view returns (string memory) {
        bytes memory imageBytes = getData("image");
        require(imageBytes.length > 0, "OnchainNFT: No image uploaded");

        if (imageBytes[0] == 0x3c) {
            return string(abi.encodePacked("data:image/svg+xml;utf8,", imageBytes));
        }

        return string(abi.encodePacked("data:image/svg+xml;base64,", imageBytes));
    }
}
