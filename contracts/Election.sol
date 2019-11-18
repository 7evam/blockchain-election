pragma solidity ^0.5.0;

contract Election {
  //Model candidate
  struct Candidate {
    uint id;
    string name;
    uint voteCount;
  }

  //Store Candidates
  //Fetch Candidates
  mapping(uint => Candidate) public candidates;
  // Store Candidates Count
  uint public candidatesCount;

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

}
