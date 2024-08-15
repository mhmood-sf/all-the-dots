{
  programs.zk = {
    enable = true;
    settings = {
      notebook = {
        # Simply set the default notebook.
        # The remaning configuration is inside the directory.
        dir = "~/NotebookZK";
      };
    };
  };
}
