pragma solidity ^0.5.0;

contract RBAC {
    event RoleCreated(uint256 role);
    event UserAdded(address account, uint256 role);
    event UserRemoved(address account, uint256 role);
    
    /**
     * @notice A role, which will be used to group users.
     * @dev The role id is its position in the roles array.
     * @param description A description for the role.
     * @param admin The only role that can add or remove users
     * from this role. For role users to be also the role
     * admins you should pass roles.length as the admin role.
     * @param user Addresses belonging to this role.
     */
    struct Role {
        string description;
        uint256 admin;
        address[] users;
    }
    
    Role[] public roles;
    
     constructor() public {
    }
    
    function addRole(string memory _roleDescription, uint256 _admin) public returns(uint256)
    {
        require(_admin <= roles.length, "Admin role doesn't exist.");
        uint256 role = roles.push(Role({description: _roleDescription,admin: _admin,users: new address[](0)})) - 1;
        emit RoleCreated(role);
        if (_admin == role) {
            roles[role].users.push(msg.sender);
            emit UserAdded(msg.sender, role);
        }
        return role;
    }
    
    function hasRole(address _account,  uint256 _role) public view returns(bool)
    {
        if (_role >= roles.length ) return false;
            address[] memory _users = roles[_role].users;
            for (uint256 i = 0; i < _users.length; i++){
                if (_users[i] == _account) return true;
            }
        return false;
    }
    
    function addUser(address _account, uint256 _role) public
    {
        require(_role < roles.length, "Role doesn't exist.");
        require(hasRole(msg.sender, roles[_role].admin),"User not authorized to add users.");
        if (hasRole(_account, _role) == false){
            roles[_role].users.push(_account);
            emit UserAdded(_account, _role);
        }
    }
    
    function removeUser(address _account, uint256 _role) public
    {
        require(_role < roles.length, "Role doesn't exist.");
        require(hasRole(msg.sender, roles[_role].admin),"User not authorized to remove users.");
        address[] memory _users = roles[_role].users;
        for (uint256 i = 0; i < _users.length; i++){
            if (_users[i] == _account){
                _users[i] = _users[_users.length - 1];
                roles[_role].users.pop();
                emit UserRemoved(_account, _role);
            }
        }
    }
}
    
    