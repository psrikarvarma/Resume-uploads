from tkinter import*

t=Tk()

col=2
ro=2

def sum():
    if(e_1.get().isdigit()):
        fries=e_1.get()
    else:
        fries=0
        
    if(e_2.get().isdigit()):
        nood=e_2.get()
    else:
        nood=0

    if(e_3.get().isdigit()):
        sou=e_3.get()
    else:
        sou=0

    if(e_4.get().isdigit()):
        bu=e_4.get()
    else:
        bu=0

    if(e_5.get().isdigit()):
        sa=e_5.get()
    else:
        sa=0

    if(e_6.get().isdigit()):
        dr=e_6.get()
    else:
        dr=0
    
    tot=float(fries)*30 + float(nood)*30 + float(sou)*10 + float(bu)*25 + float(sa)*35 + float(dr)*15
    e_7.delete(0,END)
    e_7.insert(0,tot)
    e_8.delete(0,END)
    e_8.insert(0,tot*0.15)
    e_9.delete(0,END)
    e_9.insert(0,tot*0.05)
    e_10.delete(0,END)
    e_10.insert(0,tot*0.20)
    e_11.delete(0,END)
    e_11.insert(0,tot*1.20)

def reset():
    e_1.delete(0,END)
    e_2.delete(0,END)
    e_3.delete(0,END)
    e_4.delete(0,END)
    e_5.delete(0,END)
    e_6.delete(0,END)
    e_7.delete(0,END)
    e_8.delete(0,END)
    e_9.delete(0,END)
    e_10.delete(0,END)
    e_11.delete(0,END)

Label(t,text='Flavours Restaurant',fg='red').grid(row=ro-2,column=col+2)

Label(t,text='Fries').grid(row=ro)
Label(t,text='Noodles').grid(row=ro+1)
Label(t,text='Soup').grid(row=ro+2)
Label(t,text='Burger').grid(row=ro+3)
Label(t,text='Sandwich').grid(row=ro+4)
Label(t,text='Drinks').grid(row=ro+5)

e_1=Entry(t,bd=1,bg='skyblue')
e_2=Entry(t,bd=1,bg='skyblue')
e_3=Entry(t,bd=1,bg='skyblue')
e_4=Entry(t,bd=1,bg='skyblue')
e_5=Entry(t,bd=1,bg='skyblue')
e_6=Entry(t,bd=1,bg='skyblue')

e_1.grid(column=col+1,row=ro+0)
e_2.grid(column=col+1,row=ro+1)
e_3.grid(column=col+1,row=ro+2)
e_4.grid(column=col+1,row=ro+3)
e_5.grid(column=col+1,row=ro+4)
e_6.grid(column=col+1,row=ro+5)


b_1=Button(t,text='Total',relief=FLAT,command=sum)
b_1.grid(column=col+1,row=ro+6)

Label(t,text='30/-').grid(column=col+2,row=ro+0)
Label(t,text='30/-').grid(column=col+2,row=ro+1)
Label(t,text='10/-').grid(column=col+2,row=ro+2)
Label(t,text='25/-').grid(column=col+2,row=ro+3)
Label(t,text='35/-').grid(column=col+2,row=ro+4)
Label(t,text='15/-').grid(column=col+2,row=ro+5)

b_2=Button(t,text='Reset',relief=FLAT,command=reset)
b_2.grid(column=col+2,row=ro+6)

Label(t,text='Cost of meal').grid(column=col+3,row=ro+0)
Label(t,text='Service charge').grid(column=col+3,row=ro+1)
Label(t,text='Sales Tax').grid(column=col+3,row=ro+2)
Label(t,text='Sub Total').grid(column=col+3,row=ro+3)
Label(t,text='Total Amount').grid(column=col+3,row=ro+4)

e_7=Entry(t,bd=1,bg='skyblue')
e_8=Entry(t,bd=1,bg='skyblue')
e_9=Entry(t,bd=1,bg='skyblue')
e_10=Entry(t,bd=1,bg='skyblue')
e_11=Entry(t,bd=1,bg='skyblue')

e_7.grid(column=col+4,row=ro+0)
e_8.grid(column=col+4,row=ro+1)
e_9.grid(column=col+4,row=ro+2)
e_10.grid(column=col+4,row=ro+3)
e_11.grid(column=col+4,row=ro+4)

b_3=Button(t,text='Quit',relief=FLAT,command=t.destroy)
b_3.grid(column=col+3,row=ro+6)

Label(t,text='15%').grid(column=col+5,row=ro+1)
Label(t,text='5%').grid(column=col+5,row=ro+2)

t.geometry('500x200+100+100')
t.mainloop()
