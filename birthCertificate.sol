pragma solidity 0.8.5;
contract BirthCertificate
{
    struct localGovtBOCD{
        // name of local government
        string localGovernment;
        // the array that holds number of people in the database
        uint[] peopleInTheDatabase;
        // maps a name to person details
        mapping(string => Person) nameToPersonDetails;
    }

    // a struct to hold some of the properties of a person: address, place of birth, full name
    struct Person {
        address ownerAddress;
        string name;
        string location;
        uint date;
    }

    // address localGovernment;
    // uint public totalCounter;

    // ID to local government
    mapping(string => localGovtBOCD) IdToLocalGovernment;
   
//    functions

   
//    constructor () {
//        msg.sender = localGovernment;
//    }
    // modifier government{
    //     require(msg.sender == localGovernment, "Not Authorized");
    //     _;
    // }

// to register local government
    function registerLocalGovernment(string calldata _nameOfLG) external{
        // pointer
        localGovtBOCD storage L = IdToLocalGovernment[_nameOfLG];
        L.localGovernment = _nameOfLG;
    }

// to register person
    function  registerPerson(address _ownerAddress, string calldata _location, string calldata _name, uint _date, string calldata _nameOfLG) public{
        localGovtBOCD storage L = IdToLocalGovernment[_nameOfLG];
        Person storage myPerson = L.nameToPersonDetails[_name];
        myPerson.ownerAddress = _ownerAddress;
        myPerson.name = _name;
        myPerson.location = _location;
        myPerson.date = _date;
    //     address ownerAddress;
    //     string name;
    //     string 
    }

    // get all registered person
    function getAllRegisteredPerson(string[] memory registrar, string calldata _nameOfLG) public view returns (Person[] memory use){
       use = new Person[](registrar.length);
       for (uint i = 0; i < registrar.length; i++){
           localGovtBOCD storage L = IdToLocalGovernment[_nameOfLG];
           Person storage myPerson = L.nameToPersonDetails[registrar[i]];
        //    localGovtBOCD storage government = IdToLocalGovernment[registrar[i]];
           Person memory u = use[i];
           u.ownerAddress = myPerson.ownerAddress;
           u.name = myPerson.name;
           u.location = myPerson.location;
           u.date = myPerson.date;

       }

    }
