<div align="center">
<h1>guide to tweaking and configuring the template buttons
</div>

<div align="left">
<h2>part 0: knowing what the hell you're dealing with
</div>
  
in the last lines of the [source code](https://github.com/hypotisctic/ojteyesonlycuddy/blob/main/source.lua), youll find the toggle and button templates there

they look like this (highlighted code)

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

<div align="left">
<h2>part 1.5: if you want to name the button/toggle
</div>

#### you can set the name for ur toggle/button by finding "source code" using your code previewer and replacing it with whatever u want

---

toggle version <img width="1523" height="375" alt="image" src="https://github.com/user-attachments/assets/4be8abec-0ca3-4fea-8642-ffc8f00a6582" />

button version <img width="1520" height="420" alt="image" src="https://github.com/user-attachments/assets/f69d8e66-c116-4d17-af78-f9700e7dbbcd" />

it should look like this once executed if done right

<img width="240" height="223" alt="image" src="https://github.com/user-attachments/assets/1cf6218e-560c-4b1f-ac2a-d24d6b02020f" />


<div align="left">
<h2>part 2: the fun part
</div>

#### go ahead and press that button or toggle, it should work, if not, oh well thats your fault
---
custom button

<img width="925" height="208" alt="image" src="https://github.com/user-attachments/assets/c7b6b71a-5b83-4c69-a946-7bb0d4b0f6db" />

custom toggle

<img width="817" height="523" alt="image" src="https://github.com/user-attachments/assets/3df5cf20-afd0-4164-a948-b971ff72ec5d" />
