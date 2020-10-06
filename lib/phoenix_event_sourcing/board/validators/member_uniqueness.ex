defmodule PhoenixEventSourcing.Boards.Validators.MemberUniqueness do

  def validate_uniqueness(board, add_board_member) do
    case find_member(board, add_board_member) do
      nil ->
        :ok

      _ ->
        {:error, :member_duplicated}
    end
  end

  defp find_member(board, add_board_member) do
    Enum.find(
      board.board_members,
      fn m -> m.user_id == add_board_member.user_id end
    )
  end

end
