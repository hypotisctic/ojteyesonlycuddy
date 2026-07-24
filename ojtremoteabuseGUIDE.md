<div align="center">
<h1>guide to tweaking and configuring the template buttons
</div>

<div align="left">
<h2>part 0: knowing what the hell your dealing with
</div>
  
in the last lines of the code, youll find the toggle and button templates there

they look like this (highlighted part)

<img width="585" height="328" alt="image" src="https://github.com/user-attachments/assets/8f939805-fe91-41a1-b403-f7950cd0eaf1" />

> [!NOTE]
> notice the name of the specific toggle "toggle1"
> 
> <img width="745" height="22" alt="image" src="https://github.com/user-attachments/assets/a31596af-b415-4bbd-8690-c99e0de05743" />
>
> ---
> 
> you can use a finder (preferrably VSC) to find the specific name like "toggle1.TextButton.LocalScript"
>
> <img width="1518" height="161" alt="image" src="https://github.com/user-attachments/assets/effcdf3d-3841-426a-b8f4-1b5e03f9b5e1" />
>
> or you can search for all the customizable templates by finding "ojts"
>
> <img width="585" height="362" alt="image" src="https://github.com/user-attachments/assets/10771996-d3b4-480b-bbd7-52d6f58cc2fe" />

<div align="left">
<h2>part 1: actually inserting your code
</div>

#### obviously the button templates are just buttons, if you put a remote in there it will just do it once
#### and the toggle templates will loop whatever remote or code you insert in it until you click on it again
> [!WARNING]
> be careful with the toggle templates, if you put in laggy stuff that can crash your game if looped, PLEASE put a task.wait() or some type of delay

#### this is where you put your own code

<img width="321" height="23" alt="image" src="https://github.com/user-attachments/assets/83c66263-4d17-4032-a1a1-e4c4dc02dae3" />
