local Client = Class {
    init = function(self, address, port)
        self.address = address
        self.port = port
        self.socket = nil
    end;
}

return Client
