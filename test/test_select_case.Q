[General]
SyntaxVersion=2
BeginHotkey=121
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=33bb2f1e-6904-43fc-8106-2730672d5916
Description=test_select_case
Enable=1
AutoRun=0
[Repeat]
Type=0
Number=1
[SetupUI]
Type=2
QUI=
[Relative]
SetupOCXFile=
[Comment]

[Script]
//�ۭq�ܼ�is at the right panel

//�зǫ��ۭq�ܼ�
//�榡: UserVar {�ܼ�}={�w�]��} {�`��}
//����:�o�өR�O�D�n�Ω�ϥΪ̦ۭq���]�m�\��
UserVar var1=30 "��HP�զh�֢H�ɡA�ϥά���"
UserVar var2=30 "��MP�զh�֢H�ɡA�ϥ�����"
//���ϥΪ̨ϥγo�Ӹ}�����ɭԡA�i�H��ovar1�Mvar2�o����ܼƪ����ȶi��]�m
//�U�ԫ��ۭq�ܼ�
//�榡: UserVar �ܼ�=DropList{�ﶵ0:��0|�ﶵ1:��1|�ﶵ2:��2}=�w�]��ܪ��ﶵ�s�� {�`��}
//����:�o�өR�O�w���]�w�h���ܼƭȡA�ϥΪ̥i�b�򭱳q�L�U�Ԥ覡�i����
UserVar Var1=DropList{"�C��10%�ɸɦ�":0.1|"�C��20%�ɸɦ�":0.2|"�C��30%�ɸɦ�":0.3}=2 "�۰ʸɦ�]�m"
//�S�O�����G�w�]��ܪ��ﶵ�s���q0�}�l

//���䴩�P�_�y�y �p�GCase a>0
num = 1
//<>---------------------------------------------�H�U�O��ܱ��󵲵��c�P�_
Select Case num
Case 0
    Msgbox "�A��J���Ʀ쬰�G0"
Case 1
    Msgbox "�A��J���Ʀ쬰�G1"
    num = 2
    // a invisible exit case here
Case 2
    Msgbox "�A��J���Ʀ쬰�G2"
Case 3
    Msgbox "�A��J���Ʀ쬰�G3"
Case 4
    Msgbox "�A��J���Ʀ쬰�G4"
Case 5
Case 6
    Msgbox "�A��J���Ʀ쬰�G6"
Case 7
    Msgbox "�A��J���Ʀ쬰�G7" 
Case 8
    Msgbox "�A��J���Ʀ쬰�G8" 
Case 9
    Msgbox "�A��J���Ʀ쬰�G9" 
Case Else
    Msgbox "�A��J���Ʀ줣���T�A�п�J�]0~9�^�Ʀ�I"
End Select