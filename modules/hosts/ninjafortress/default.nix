{ self, inputs, ... }: {

  flake.nixosConfigurations.ninjaFortress = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.ninjaFortCfg
    ];
  };
  
}
