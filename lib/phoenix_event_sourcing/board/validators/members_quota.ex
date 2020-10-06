defmodule PhoenixEventSourcing.Boards.Validators.MembersQuota do
  def validate_quota(%{board_members: members} = board, add_board_member) do
    quota = get_board_member_quota(board)

    cond do
      length(members) < quota ->
        :ok

      true ->
        {:error, :members_quota_reached}
    end
  end

  defp get_board_member_quota(%{project_id: project_id} = board) when project_id > 0 do
    200
  end

  defp get_board_member_quota(_) do
    Application.get_env(:leangoo_api, :personal_board_member_quota, 20)
  end
end
