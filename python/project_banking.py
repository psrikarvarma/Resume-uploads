class bank_acc:
    def new_acc(self,acc_no,name,acc_ty,acc_bal):
        
        indiv=[]
        
        self.acc_no=acc_no
        indiv.append(self.acc_no)
        
        self.name=name
        indiv.append(self.name)
        
        self.acc_ty=acc_ty
        indiv.append(self.acc_ty)
        
        self.acc_bal=acc_bal
        indiv.append(acc_bal)

        return indiv

ob=bank_acc()

import pickle as pa

#data_prev=[], UNCOMMENT in your first time execution

fo=open('bank_db.txt','rb')#COMMENT this block in your first time execution and then UNCOMMENT for furthur
data_prev=pa.load(fo)
fo.close()

ch='0'
while(ch!='8'):
    print('\n\t\t\t\t\t\t\t   Welcome to BANKING MANAGEMENT SYSTEM\n\n')#display MENU
    print('\t\t\t\t\t\t\t\t      MAIN MENU\n')
    print('\t\t\t\t\t\t\t   Create a New Account - 1')
    print('\t\t\t\t\t\t\t   Deposit - 2')
    print('\t\t\t\t\t\t\t   Withdraw - 3')
    print('\t\t\t\t\t\t\t   Check Account Balance - 4')
    print('\t\t\t\t\t\t\t   Account List - 5')
    print('\t\t\t\t\t\t\t   Close Account - 6')
    print('\t\t\t\t\t\t\t   Modify Account - 7')
    print('\t\t\t\t\t\t\t   EXIT - 8\n')
    
    ch=input('Enter your Choice ')
    print('\n')

    if(ch=='1'):#for new account
        L=[]
        newacc_no=input('Enter a New Account number ')#inputs from user
        newacc_name=input('\nEnter Account Holder Name ')
        newacc_type=input('\nEnter Account Type, \'s\' for Savings and \'c\' for Current Accounts Type ')
        newacc_dep=input('\nEnter your first Deposit Amount ')
        print('\n')
        print('New Account created Successfully')
        
        L=ob.new_acc(newacc_no,newacc_name,newacc_type,newacc_dep)#calling class method and returning list
        data_prev.append(L)#appending to bank data base

        fo_1=open('bank_db.txt','wb')#modifying bank data base in bank_db.txt using pickle package
        pa.dump(data_prev,fo_1)
        fo_1.close()
        print('\n')

    if(ch=='2'):#for deposit
        dep_acc_no=input('Enter your Account number ')#inputs from user

        count=0
        for i in range(len(data_prev)):
            if(dep_acc_no==data_prev[i][0]):#checks for account number in data base
                count+=1
        if(count==0):
            print('\nAccount Number not found, Try Once Again')#if account not created
            dep_acc_no=input('\nEnter your Account Number ')#gives user two chances for correction
            ct=0
            for i in range(len(data_prev)):
                if(dep_acc_no==data_prev[i][0]):#checks for account number in data base
                    ct+=1
            if(ct==0):
                print('\nYour Account is NOT Created, Please contact our Bank')
                continue
            
        dep=input('\nEnter Deposit Amount ')
        
        if(int(dep)<=0):
            print('\nPlease Enter Correct Amount\n')
            dep=input('Enter Deposit Amount ')#gives user two chances for correction

        lis=[]#list to get all Accounts having same Account number
        mul_name='0'
        for i in range(len(data_prev)):
            if(dep_acc_no==data_prev[i][0]):
                lis.append(data_prev[i])
        if(len(lis)>1):
            mul_name=input('\nYour Account Number is also used by another User, so please provide Account holder Name ')
            for i in range(len(data_prev)):
                if(mul_name==data_prev[i][1]):
                    data_prev[i][3]=str(int(data_prev[i][3])+int(dep))
        else:
            for i in range(len(data_prev)):
                if(dep_acc_no==data_prev[i][0]):#checks for account number in data base
                    data_prev[i][3]=str(int(data_prev[i][3])+int(dep))#if found, increment balance by deposit

        print('\nAmount Credited in your Account Successfully, Don\'t FORGET to check your Balance')#displays message

        fo_1=open('bank_db.txt','wb')#modifying bank data base in bank_db.txt using pickle package
        pa.dump(data_prev,fo_1)
        fo_1.close()
        print('\n')

    if(ch=='3'):#for withdrawl
        wi_acc_no=input('Enter your Account number ')#inputs from user

        count=0
        for i in range(len(data_prev)):
            if(wi_acc_no==data_prev[i][0]):#checks for account number in data base
                count+=1
        if(count==0):
            print('\nAccount Number not found, Try Once Again')#if account not created
            wi_acc_no=input('\nEnter your Account Number ')#gives user two chances for correction
            ct=0
            for i in range(len(data_prev)):
                if(wi_acc_no==data_prev[i][0]):#checks for account number in data base
                    ct+=1
            if(ct==0):
                print('\nYour Account is NOT Created, Please contact our Bank')
                continue
            else:
                count=ct
            
        wi=input('\nEnter Withdrawl Amount ')
        
        if(int(wi)<=0):
            print('\nPlease Enter Correct Amount\n')
            wi=input('Enter Withdrawl Amount ')#gives user two chances for correction

        lis=[]#list to get all Accounts having same Account number
        mul_name='0'
        for i in range(len(data_prev)):
            if(wi_acc_no==data_prev[i][0]):
                lis.append(data_prev[i])
        if(len(lis)>1):
            mul_name=input('\nYour Account Number is also used by another User, so please provide Account holder Name ')
            for i in range(len(data_prev)):
                if(mul_name==data_prev[i][1]):
                    data_prev[i][3]=str(int(data_prev[i][3])-int(wi))
        else:
            for i in range(len(data_prev)):
                if(wi_acc_no==data_prev[i][0]):#checks for account number in data base
                    data_prev[i][3]=str(int(data_prev[i][3])-int(wi))#if found, increment balance by deposit

        print('\nAmount Debited in your Account Successfully, Don\'t FORGET to check your Balance')#displays message

        fo_1=open('bank_db.txt','wb')#modifying bank data base in bank_db.txt using pickle package
        pa.dump(data_prev,fo_1)
        fo_1.close()
        print('\n')
        

    if(ch=='4'):#Display Balance
        ba_no=input('Enter your Account Number ')

        count=0
        for i in range(len(data_prev)):
            if(ba_no==data_prev[i][0]):#checks for account number in data base
                count+=1
        if(count==0):
            print('\nAccount Number not found, Try Once Again')#if account not created
            ba_no=input('\nEnter your Account Number ')#gives user two chances for correction
            ct=0
            for i in range(len(data_prev)):
                if(ba_no==data_prev[i][0]):#checks for account number in data base
                    ct+=1
            if(ct==0):
                print('\nYour Account is NOT Created, Please contact our Bank')
                continue
            else:
                count=ct
        if(count==1):
            for i in range(len(data_prev)):
                if(ba_no==data_prev[i][0]):
                    print('\nBalance in your Account is '+data_prev[i][3])
            print('\n')
        if(count>1):
            lis=[]#list to get all Accounts having same Account number
            for i in range(len(data_prev)):
                if(ba_no==data_prev[i][0]):
                    lis.append(data_prev[i])
                    
            mul_name=input('\nYour Account Number is also used by another User, so please provide Account holder Name ')
            for j in range(len(lis)):
                if(mul_name==lis[j][1]):
                    print('Balance in your Account is '+lis[j][3])
                print('\n')
            

    if(ch=='5'):#for Display Accounts list
        for i in data_prev:#goes to every list inside list
            for j in range(4):
                if(j==3):
                    print(i[j])
                else:#display all elements in sub-list
                    print(i[j],end=', ')
        print('\nAll Accounts Info Displayed Successfully')#display message
        print('\n')

    if(ch=='6'):#for Closing Account
        del_acc_no=input('Enter Account Number ')

        count=0
        for i in range(len(data_prev)):
            if(del_acc_no==data_prev[i][0]):#checks for account number in data base
                count+=1
                
        if(count==0):
            print('\nAccount Number not found, Try Once Again')#if account not created
            del_acc_no=input('\nEnter your Account Number ')#gives user two chances for correction
            ct=0
            for i in range(len(data_prev)):
                if(del_acc_no==data_prev[i][0]):#checks for account number in data base
                    ct+=1
            if(ct==0):
                print('\nYour Account is NOT Created, Please contact our Bank')
                continue
            else:
                count=ct

        if(count!=0):
            lis=[]#list to get all Accounts having same Account number
            for i in range(len(data_prev)):
                if(del_acc_no==data_prev[i][0]):
                    lis.append(data_prev[i])
                    
            if(len(lis)==1):
                data_prev.remove(lis[0])
                print('\nAccount deleted Successfully')
            if(len(lis)>1):
                mul_name=input('\nYour Account Number is also used by another User, so please provide Account holder Name ')
                for j in range(len(lis)):
                    if(mul_name==lis[j][1]):
                        #Ask a final question
                        data_prev.remove(lis[j])
                        print('\nAccount deleted Successfully')

        fo_1=open('bank_db.txt','wb')
        pa.dump(data_prev,fo_1)
        fo_1.close()
        print('\n')
        
    if(ch=='7'):#Modify Account Name or Acc. Type
        ch_1=0
        mo_acc_no=input('Enter your Account Number ')       
        '''print('\t\t\t\t\t\t\t   Modify Name - 1')
        print('\t\t\t\t\t\t\t   Modify Acc. Type - 2')
        
        mo_ch=input('Enter your Choice ')'''
        
        count=0
        for i in range(len(data_prev)):
            if(mo_acc_no==data_prev[i][0]):#checks for account number in data base
                count+=1
                
        if(count==0):
            print('\nAccount Number not found, Try Once Again')#if account not created
            mo_acc_no=input('\nEnter your Account Number ')#gives user two chances for correction
            ct=0
            for i in range(len(data_prev)):
                if(mo_acc_no==data_prev[i][0]):#checks for account number in data base
                    ct+=1
            if(ct==0):
                print('\nYour Account is NOT Created, Please contact our Bank')
                continue
            else:
                count=ct
                
        print('\t\t\t\t\t\t\t   Modify Name - 1')
        print('\t\t\t\t\t\t\t   Modify Acc. Type - 2')
        mo_ch=input('Enter your Choice ')
        
        if(count!=0):
            lis=[]#list to get all Accounts having same Account number
            for i in range(len(data_prev)):
                if(mo_acc_no==data_prev[i][0]):
                    lis.append(data_prev[i])
                    
            if(len(lis)==1):
                if(mo_ch=='1'):
                    new_na=input('\nEnter Account Holder Name ')
                    for i in data_prev:
                        if(mo_acc_no==i[0]):
                            i[1]=new_na
                            print('\nAccount Holder Name modified Successfully')
                if(mo_ch=='2'):
                    for i in range(len(data_prev)):
                        if(mo_acc_no==data_prev[i][0]):
                            if(data_prev[i][2]=='s'):
                                data_prev[i][2]='c'
                            elif(data_prev[i][2]=='c'):
                                data_prev[i][2]='s'
                    print('\nYour Account Type is changed Successfully')
                    
            if(len(lis)>1):
                mul_name=input('\nYour Account Number is also used by another User, so please provide Account holder Name ')
                for j in range(len(lis)):
                    if(mul_name==lis[j][1]):
                        if(mo_ch=='1'):
                            new_na=input('\nEnter Account Holder Name ')
                            for i in data_prev:
                                if(mo_acc_no==i[0]):
                                    i[1]=new_na
                            print('\nAccount Holder Name modified Successfully')
                        if(mo_ch=='2'):
                            for i in range(len(data_prev)):
                                if(mo_acc_no==data_prev[i][0]):
                                    if(data_prev[i][2]=='s'):
                                        data_prev[i][2]='c'
                                    elif(data_prev[i][2]=='c'):
                                        data_prev[i][2]='s'
                            print('\nYour Account Type modified Successfully')

            fo_1=open('bank_db.txt','wb')
            pa.dump(data_prev,fo_1)
            fo_1.close()
            print('\n')
    else:
        if(ch!='8'):
            print('Invalid Choice\n')

print('\t\t\t\t\t\t     THANK YOU for using our BANKING MANAGEMENT SYSTEM')       
        
        

