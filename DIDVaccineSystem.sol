//SPDX-License-Identifier : GPL-3.0
pragma solidity >= 0.7.0 <0.9.0;

contract DIDVaccineSystem {

    address private issuerAddress;
    uint256 private idCount;
    mapping(uint8=>string) private manufacturerEnum;
    mapping(uint8=>string) private vaccineDoseEnum;

    struct Credential {
        uint256 id;
        address issuer;
        uint8 manufacturerType;
        uint8 vaccineDoseType;
        string value;
        uint256 createDate;
    }
    
    mapping(address=> Credential) private credentials;

    constructor() {
        issuerAddress = msg.sender;
        idCount = 1;
        manufacturerEnum[0] = "Astrazeneca";
        manufacturerEnum[1] = "Janssen";
        manufacturerEnum[2] = "Pfizer";
        manufacturerEnum[3] = "Moderna";
        manufacturerEnum[4] = "Novavax";
        vaccineDoseEnum[0] = "1st";
        vaccineDoseEnum[1] = "2nd";
        vaccineDoseEnum[2] = "3rd";
        vaccineDoseEnum[3] = "4th";
        vaccineDoseEnum[4] = "5th";
        vaccineDoseEnum[5] = "6th";
        vaccineDoseEnum[6] = "7th";
        vaccineDoseEnum[7] = "8th";
        vaccineDoseEnum[8] = "9th";
        vaccineDoseEnum[9] = "10th";
        vaccineDoseEnum[10] = "11th";
        vaccineDoseEnum[11] = "12th";
        vaccineDoseEnum[12] = "13th";
        vaccineDoseEnum[13] = "14th";
        vaccineDoseEnum[14] = "15th";
        vaccineDoseEnum[15] = "16th";
    }

    function claimCredential(address _userAddress, uint8 _manufacturerType, uint8 _vaccineDoseType, string calldata _value) public returns(bool){

        require(issuerAddress == msg.sender, "You are not a issuer");
        Credential storage credential = credentials[_userAddress];
        require(credential.id == 0);
        credential.id = idCount;
        credential.issuer = msg.sender;
        credential.manufacturerType = _manufacturerType;
        credential.vaccineDoseType = _vaccineDoseType;
        credential.value = _value;
        credential.createDate = block.timestamp;

        idCount += 1;

        return true;
    }

    function getCredential(address _userAddress) public view returns(Credential memory) {
        return credentials[_userAddress];
    }

}