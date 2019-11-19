pragma solidity ^0.5.0;

contract Election {
  //Model candidate
  struct Candidate {
    uint id;
    string name;
    uint voteCount;
  }

  // a mapping is like a hash table

  //Store accounts that have voted
  // if address not contained in mapping, boolean will default to false
  mapping(address => bool) public voters;
  //Store Candidates
  //Fetch Candidates
  mapping(uint => Candidate) public candidates;
  // Store Candidates Count
  uint public candidatesCount;

  event votedEvent (
    uint indexed _candidateId
  );

  constructor() public {
    addCandidate("Pecan");
    addCandidate("Maple Bourbon Brown Butter Peach");
  }

  // local variables have _s, state variables do not
  // private means no one else is able to add a candidate

  function addCandidate (string memory _name) private {
    candidatesCount ++;
    candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
  }

  // solidity allows metadata to be passed into function,
  // it doesn't need to be passed through to function
  function vote (uint _candidateId) public {
    // require that they havent voted before
    // check if msg.sender is in the voters mapping
    require(!voters[msg.sender]);

    // require that candidate is valid
    require(_candidateId > 0 && _candidateId <= candidatesCount);

    // record that voter has voted by referencing voters mapping
    voters[msg.sender] = true;

    // update candidate vote Count
    candidates[_candidateId].voteCount++;

    // trigger voted event
    emit votedEvent(_candidateId);
  }

}
