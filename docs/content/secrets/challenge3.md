+++
title = "Challenge 3 (Intermediate)"
weight = 15
+++

### Use Vault's unwrap command to unlock master key

Star-lord is tasked to go across galaxy with limited access. This time Thanos has wrapped the key to unlock the galaxy secret. To help Nova has left a clue in the kv locker which if unearthed will pave the way to find and retrieve the master key.
The access is controlled via policy. 

Star Lord's need to follow the trail with hints given below to recover 

  1) Search out for the token using which you get limited access to the vault server 
  ```
  cat /mount/breadcrumb
  ```
  2) Login using this token
   ```
  vault login <token-received-in-step-1>
  ```
  3) Search for the token which is hidden in the kv secret hierarchy . Start from here 
  ```
    vault kv list /secret
  ```
   *_Hint_*: vault kv secrets are stored in hierarchial paths, think unix files and directory  

  4) Once you encounter a kv secret key use following command to see the value 

  ```
    vault kv get /secret/<path_to_secret_key>
  ```
  5) Once the  secret key to unwrap one time secret( and the flag) is revealed under one of the hirarchy use following command 
  ```
    vault unwrap <token-obtained-from-step4>
  ```  
  6) The output will have a block of the unwrapped flag revealed to you  . Search for following
  ```
  flag:<>
  ```
  Enter the flag value in the CTFd portal to complete the challenge. Here is some awesome work done to save the Adobe galaxy from Thanos and reclaim order. ;o) 

  7) __Optional step__ : vault unwrap provides mechanism to share one time password with any unauthenticated user. Try to run the same command again to see if you can reveal the flag again or not. 
  ```
    vault unwrap <token-obtained-from-step4>
  ```
### More about vault unwrap 
The unwrap command unwraps a wrapped secret from Vault by the given token. The result is the same as the "vault read" operation on the non-wrapped secret. If no token is given, the data in the currently authenticated token is unwrapped.
Read more about vault policy which can be used to provide fine grain access of secrets - see [link](https://www.vaultproject.io/docs/concepts/policies.html)

- __More Hints__
  - If you get message like "	* permission denied" in the response of command, that means you dont have access to the resource. Keep looking for the ones for which you have access. 