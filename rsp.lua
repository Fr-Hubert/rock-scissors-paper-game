-- Luaでのじゃんけんゲーム

-- コンピュータの選択を取得する関数
local function get_computer_choice()
    local choices = {"rock", "paper", "scissors"}
    local random_index = math.random(1, #choices)
    return choices[random_index]
end

-- 勝者を決定する関数
local function determine_winner(player_choice, computer_choice)
    if player_choice == computer_choice then
        return "It's a tie!"
    elseif (player_choice == "rock" and computer_choice == "scissors") or
           (player_choice == "scissors" and computer_choice == "paper") or
           (player_choice == "paper" and computer_choice == "rock") then
        return "You win!"
    else
        return "You lose!"
    end
end

-- ゲームのメイン関数
local function play_game()
    -- プレイヤーの選択を取得
    print("Enter your choice (rock, paper, or scissors):")
    local player_choice = io.read():lower()

    -- プレイヤーの選択が有効かどうか確認
    local valid_choices = {["rock"]=true, ["paper"]=true, ["scissors"]=true}
    if not valid_choices[player_choice] then
        print("Invalid choice. Please choose rock, paper, or scissors.")
        return
    end

    -- コンピュータの選択を取得
    local computer_choice = get_computer_choice()

    -- 選択を表示
    print("Player choice: " .. player_choice)
    print("Computer choice: " .. computer_choice)

    -- 勝者を決定して表示
    local result = determine_winner(player_choice, computer_choice)
    print(result)
end

-- ランダムシードを初期化
math.randomseed(os.time())

-- ゲームを開始
play_game()
