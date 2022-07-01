import { dbank } from "../../declarations/dbank";
 window.addEventListener("load",async ()=>{
    var currentBalance = await dbank.checkBalance();
    document.querySelector("#value").innerHTML=currentBalance.toFixed(2);
 });
document.querySelector("form").addEventListener("submit",  async (event)=>{
    event.preventDefault();
    event.stopImmediatePropagation();
    const btn = document.querySelector("#submit-btn")
    let credit = document.querySelector("#input-amount").value;
    let debit = document.querySelector("#withdrawal-amount").value;
    btn.setAttribute("disabled",true);
    if(credit!="")
    {
        await dbank.topUp(parseFloat(credit));
    }
    if(debit!="")
    {
        await dbank.withdraw(parseFloat(debit));
    }
    var currentBalance = await dbank.checkBalance();
    document.querySelector("#value").innerHTML=currentBalance.toFixed(2);
    btn.removeAttribute("disabled");
    document.querySelector("#input-amount").value="";
    document.querySelector("#withdrawal-amount").value="";
    
})