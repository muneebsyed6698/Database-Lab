<img width="223" height="241" alt="image" src="https://github.com/user-attachments/assets/6de85003-1b21-4d76-ad3e-de82ac596d90" />











<img width="441" height="416" alt="image" src="https://github.com/user-attachments/assets/137231c6-56df-42e6-a913-72b3809d4bd1" />










<img width="556" height="447" alt="image" src="https://github.com/user-attachments/assets/71862485-9ccf-4d93-882c-da6c93e025df" />













these temporarily sve rows can be deleted on rolling back by any other user









<img width="381" height="186" alt="image" src="https://github.com/user-attachments/assets/cb6d600c-28ac-477d-8eac-d4b7659aad29" />












write COMMIT to prevent change revertion









<img width="476" height="429" alt="image" src="https://github.com/user-attachments/assets/fd8b2833-a593-48b1-9a01-20c905667c3d" />











only one row was committed so it is not reverted on rollback








<img width="287" height="166" alt="image" src="https://github.com/user-attachments/assets/8ecc080a-db27-4a5e-ac8a-771e6591b8a9" />



# SavePoint: marker of any query.





<img width="497" height="262" alt="image" src="https://github.com/user-attachments/assets/53ad51c7-f901-47eb-b4fd-de95c7b0bdc1" />













<img width="591" height="391" alt="image" src="https://github.com/user-attachments/assets/89cb6c86-8572-4329-a0b8-172d96913c1f" />




first insert the records, then execute the above savePoint thing(applying marker on the action/query)



<img width="331" height="156" alt="image" src="https://github.com/user-attachments/assets/c8ea4d35-271b-4e0d-a076-1cc345577a4c" />












<img width="588" height="543" alt="image" src="https://github.com/user-attachments/assets/24152499-ad3d-4d6b-a5b2-503f5ef40947" />







in the above, the very first row is committed which cant be rolled back and the below four are save points which can be rolled back.
Rollback to Second --it will go till the save point Second. where the second wala kaam ended



# command:
ROLLBACK To First
-- what it did: went till the first save point, seond save point reverted







<img width="272" height="149" alt="image" src="https://github.com/user-attachments/assets/abf99356-e8b6-4a3a-ae39-504a87726700" />





-- solve for the atm scenario: 
