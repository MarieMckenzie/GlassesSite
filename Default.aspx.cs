using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _1602967_Milestone1
{
    public partial class _Default : Page
    {
        ApplicationUserManager userMgr;
        ApplicationRoleManager roleMgr;
        
        protected void Page_Load(object sender, EventArgs e)
        {

            userMgr =
                ContextBoundObject.GetOwinContext().GetUserManager<ApplicationUserManager>();

            roleMgr = ContextBoundObject.GetOwinContext().Get<ApplicationRoleManager>();

        }

        public IQueryable<IdentityRole> grdRoles_GetData()
        {
            return roleMgr.Roles;
        }

        public IQueryable<ApplicationUser> grdUsers_GetData()
        {
            return userMgr.Users;
        }

        public Object dvUsers_GetItem([Control] string grdUsers)
        {
            if (grdUseers == null) return new ApplicationUser();

            return (from u in userMgr.Users
                    where u.Id == grdUsers
                    select u).SingleOrDefault();
        }

        public object dvRoles_GetItem([Control] string grdRoles)
        {
            if (grdRoles == nnull) return new IdentityRole();

            return (from r in roleMgr.Roles
                    where roleMgr.Id == grdRoles
                    select r).SingleOrDefault();

        }

        public void dvUsers_UpdateItem(string Id)
        {
            ApplicationException user = ( from u in new userMgr.Users
                                          where u.Id == Id select u).SingleOrDefault();
            TryUpdateModel(user);

            user.UserName = user.Emil;

            IdentityResult result = userMgr.Update(user);
            if (result.Suceeded) Reload();

        }

        public void dvRoles_UpdateItem(string Id)
        {
            IdentityRole role = ( from r in roleMgr.Roles
                                  where r.Id == Id select r).SingleOrDefault();
            TryUpdateModel(role);
            IdentityResult result = roleMgr.Update(role);

            if (result.Succeeded) Reload();

        }

        public void dvUsers_InsertItem()
        {
            ApplicationUser user = new ApplicationUser();

            TryUpdateModel(user);

            user.UserName = user.Email; // assign email to username

            IdentityResult result = userMgr.Create(user);

            if (result.Succeeded) Reload();
        }

        public void dvRoles_InsertItem()
        {
            IdentityRole role = new IdentityRole();

            TryUpdateModel(role);

            IdentityResult result = roleMgr.Create(role);

            if (result.Succeeded) Reload();
        }

        // Delete methods
        public void dvUsers_DeleteItem(string Id)
        {
            ApplicationUser user = (from u in userMgr.Users
                                    where u.Id == Id
                                    select u).SingleOrDefault();

            IdentityResult result = userMgr.Delete(user);

            if (result.Succeeded) Reload();
        }

        public void dvRoles_DeleteItem(string Id)
        {
            IdentityRole role = (from r in roleMgr.Roles
                                 where r.Id == Id
                                 select r).SingleOrDefault();

            IdentityResult result = roleMgr.Delete(role);

            if (result.Succeeded) Reload();
        }

        // Add roles to users
        protected void btnAddRoles_Click(object sender, EventArgs e)
        {
            string userID = ddlUsers.SelectedValue;

            foreach (ListItem item in lstRoles.Items)
            {
                // if role is selected and user is not in it, add user to role
                if (item.Selected)
                {
                    if (!userMgr.IsInRole(userID, item.Text))
                    {
                        userMgr.AddToRole(userID, item.Text);
                    }
                }
                // if role is not selected and user is in it, remove user from role
                else
                {
                    if (userMgr.IsInRole(userID, item.Text))
                    {
                        userMgr.RemoveFromRole(userID, item.Text);
                    }
                }
            }

            grdUsers.DataBind();
        }

        // Helper methods
        public string ListRoles(ICollection<IdentityUserRole> userRoles)
        {
            IdentityRole role;

            var names = new List<string>();

            foreach (var ur in userRoles)
            {
                role = (from r in roleMgr.Roles
                        where r.Id == ur.RoleId
                        select r).SingleOrDefault();

                names.Add(role.Name);
            }

            return string.Join(", ", names);
        }

        private void Reload()
        {
            grdUsers.DataBind();
            grdRoles.DataBind();
            ddlUsers.DataBind();
            lstRoles.DataBind();
        }

        // Provide for formatting GridView controls with Bootstrap
        protected void GridView_PreRender(object sender, EventArgs e)
        {
            GridView grd = (GridView)sender;

            if (grd.HeaderRow != null)
                grd.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        // Add roles to users
        protected void btnAddRoles_Click(object sender, EventArgs e)
        {
            string userID = ddlUsers.SelectedValue;
            foreach (ListItem item in lstRoles.Items)
            {
                // if role is selected and user is not in it, add user to role
                if (item.Selected)
                {
                    if (!userMgr.IsInRole(userID, item.Text))
                    {
                        userMgr.AddToRole(userID, item.Text);
                    }
                }
                // if role is not selected and user is in it, remove user from role
                else
                {
                    if (userMgr.IsInRole(userID, item.Text))
                    {
                        userMgr.RemoveFromRole(userID, item.Text);
                    }
                }
            }

            grdUsers.DataBind();
        }

        // Helper methods
        public string ListRoles(ICollection<IdentityUserRole> userRoles)
        {
            IdentityRole role;

            var names = new List<string>();

            foreach (var ur in userRoles)
            {
                role = (from r in roleMgr.Roles
                        where r.Id == ur.RoleId
                        select r).SingleOrDefault();

                names.Add(role.Name);
            }

            return string.Join(", ", names);
        }

        private void Reload()
        {
            grdUsers.DataBind();
            grdRoles.DataBind();
            ddlUsers.DataBind();
            lstRoles.DataBind();
        }

        // Provide for formatting GridView controls with Bootstrap
        protected void GridView_PreRender(object sender, EventArgs e)
        {
            GridView grd = (GridView)sender;

            if (grd.HeaderRow != null)
                grd.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

    }



}

