using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Epos
{
    public class ProductCategoryViewModel
    {
        public virtual Product objProduct { get; set; }
        public virtual IList<Relationship> objRelationship { get; set; }
        public virtual string arraycategories { get; set; }
    }
}