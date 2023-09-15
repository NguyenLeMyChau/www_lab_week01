package vn.edu.iuh.fit.labweek0120046631.models;

public class GrantAccess {
    private String id;
    private Account account;
    private boolean grant;
    private String note;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public boolean isGrant() {
        return grant;
    }

    public void setGrant(boolean grant) {
        this.grant = grant;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public GrantAccess() {
    }

    public GrantAccess(String id, Account account, boolean grant, String note) {
        this.id = id;
        this.account = account;
        this.grant = grant;
        this.note = note;
    }

    @Override
    public String toString() {
        return "GrantAccess{" +
                "id='" + id + '\'' +
                ", account=" + account +
                ", grant=" + grant +
                ", note='" + note + '\'' +
                '}';
    }
}
