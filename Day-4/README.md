# TASK1:

Timer-based console app

- Ask user a question
- Wait 5 seconds using Future
- Print “Time’s up!”

# TASK 2:

    - Output:
      - Program started...
      - Fetching data...
    //---------- 3 Seconds-----------
      - Data received: Server Response: Hello from API!
      - Now processing data...
    //---------- 2 Seconds-----------
      - Processing finished!

---

    ```
    code:
        main{
              program started
              $data
              processing
            ->await
              proccesing fineshed
        }

        fetchdata()
        {
               //from Server
              fetching data...
            ->await
              return Server response:hello from api
        }
      ```
