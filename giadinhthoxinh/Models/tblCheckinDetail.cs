//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace giadinhthoxinh.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class tblCheckinDetail
    {
        public int PK_iCheckinDetailID { get; set; }
        public int FK_iImportOrderID { get; set; }
        public Nullable<int> FK_iProductID { get; set; }
        public Nullable<int> iQuatity { get; set; }
        public Nullable<double> fPrice { get; set; }
    
        public virtual tblImportOrder tblImportOrder { get; set; }
        public virtual tblProduct tblProduct { get; set; }
    }
}
