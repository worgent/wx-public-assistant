package weixin.xigua.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class WpwxUserPublicStatusExample {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table wpwx_user_public_status
     *
     * @mbggenerated
     */
    protected String orderByClause;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table wpwx_user_public_status
     *
     * @mbggenerated
     */
    protected boolean distinct;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table wpwx_user_public_status
     *
     * @mbggenerated
     */
    protected List<Criteria> oredCriteria;

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wpwx_user_public_status
     *
     * @mbggenerated
     */
    public WpwxUserPublicStatusExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wpwx_user_public_status
     *
     * @mbggenerated
     */
    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wpwx_user_public_status
     *
     * @mbggenerated
     */
    public String getOrderByClause() {
        return orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wpwx_user_public_status
     *
     * @mbggenerated
     */
    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wpwx_user_public_status
     *
     * @mbggenerated
     */
    public boolean isDistinct() {
        return distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wpwx_user_public_status
     *
     * @mbggenerated
     */
    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wpwx_user_public_status
     *
     * @mbggenerated
     */
    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wpwx_user_public_status
     *
     * @mbggenerated
     */
    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wpwx_user_public_status
     *
     * @mbggenerated
     */
    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wpwx_user_public_status
     *
     * @mbggenerated
     */
    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wpwx_user_public_status
     *
     * @mbggenerated
     */
    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table wpwx_user_public_status
     *
     * @mbggenerated
     */
    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("WPWX_USER_PUBLIC_STATUS.id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("WPWX_USER_PUBLIC_STATUS.id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andAuthUuidIsNull() {
            addCriterion("WPWX_USER_PUBLIC_STATUS.auth_uuid is null");
            return (Criteria) this;
        }

        public Criteria andAuthUuidIsNotNull() {
            addCriterion("WPWX_USER_PUBLIC_STATUS.auth_uuid is not null");
            return (Criteria) this;
        }

        public Criteria andAuthUuidEqualTo(String value) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.auth_uuid =", value, "authUuid");
            return (Criteria) this;
        }

        public Criteria andAuthUuidNotEqualTo(String value) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.auth_uuid <>", value, "authUuid");
            return (Criteria) this;
        }

        public Criteria andAuthUuidGreaterThan(String value) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.auth_uuid >", value, "authUuid");
            return (Criteria) this;
        }

        public Criteria andAuthUuidGreaterThanOrEqualTo(String value) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.auth_uuid >=", value, "authUuid");
            return (Criteria) this;
        }

        public Criteria andAuthUuidLessThan(String value) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.auth_uuid <", value, "authUuid");
            return (Criteria) this;
        }

        public Criteria andAuthUuidLessThanOrEqualTo(String value) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.auth_uuid <=", value, "authUuid");
            return (Criteria) this;
        }

        public Criteria andAuthUuidLike(String value) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.auth_uuid like", value, "authUuid");
            return (Criteria) this;
        }

        public Criteria andAuthUuidNotLike(String value) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.auth_uuid not like", value, "authUuid");
            return (Criteria) this;
        }

        public Criteria andAuthUuidIn(List<String> values) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.auth_uuid in", values, "authUuid");
            return (Criteria) this;
        }

        public Criteria andAuthUuidNotIn(List<String> values) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.auth_uuid not in", values, "authUuid");
            return (Criteria) this;
        }

        public Criteria andAuthUuidBetween(String value1, String value2) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.auth_uuid between", value1, value2, "authUuid");
            return (Criteria) this;
        }

        public Criteria andAuthUuidNotBetween(String value1, String value2) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.auth_uuid not between", value1, value2, "authUuid");
            return (Criteria) this;
        }

        public Criteria andUserPublicIdIsNull() {
            addCriterion("WPWX_USER_PUBLIC_STATUS.user_public_id is null");
            return (Criteria) this;
        }

        public Criteria andUserPublicIdIsNotNull() {
            addCriterion("WPWX_USER_PUBLIC_STATUS.user_public_id is not null");
            return (Criteria) this;
        }

        public Criteria andUserPublicIdEqualTo(Integer value) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.user_public_id =", value, "userPublicId");
            return (Criteria) this;
        }

        public Criteria andUserPublicIdNotEqualTo(Integer value) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.user_public_id <>", value, "userPublicId");
            return (Criteria) this;
        }

        public Criteria andUserPublicIdGreaterThan(Integer value) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.user_public_id >", value, "userPublicId");
            return (Criteria) this;
        }

        public Criteria andUserPublicIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.user_public_id >=", value, "userPublicId");
            return (Criteria) this;
        }

        public Criteria andUserPublicIdLessThan(Integer value) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.user_public_id <", value, "userPublicId");
            return (Criteria) this;
        }

        public Criteria andUserPublicIdLessThanOrEqualTo(Integer value) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.user_public_id <=", value, "userPublicId");
            return (Criteria) this;
        }

        public Criteria andUserPublicIdIn(List<Integer> values) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.user_public_id in", values, "userPublicId");
            return (Criteria) this;
        }

        public Criteria andUserPublicIdNotIn(List<Integer> values) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.user_public_id not in", values, "userPublicId");
            return (Criteria) this;
        }

        public Criteria andUserPublicIdBetween(Integer value1, Integer value2) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.user_public_id between", value1, value2, "userPublicId");
            return (Criteria) this;
        }

        public Criteria andUserPublicIdNotBetween(Integer value1, Integer value2) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.user_public_id not between", value1, value2, "userPublicId");
            return (Criteria) this;
        }

        public Criteria andStatusIsNull() {
            addCriterion("WPWX_USER_PUBLIC_STATUS.status is null");
            return (Criteria) this;
        }

        public Criteria andStatusIsNotNull() {
            addCriterion("WPWX_USER_PUBLIC_STATUS.status is not null");
            return (Criteria) this;
        }

        public Criteria andStatusEqualTo(Integer value) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.status =", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotEqualTo(Integer value) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.status <>", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThan(Integer value) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.status >", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThanOrEqualTo(Integer value) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.status >=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThan(Integer value) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.status <", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThanOrEqualTo(Integer value) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.status <=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusIn(List<Integer> values) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.status in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotIn(List<Integer> values) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.status not in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusBetween(Integer value1, Integer value2) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.status between", value1, value2, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotBetween(Integer value1, Integer value2) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.status not between", value1, value2, "status");
            return (Criteria) this;
        }

        public Criteria andCreatedTimeIsNull() {
            addCriterion("WPWX_USER_PUBLIC_STATUS.created_time is null");
            return (Criteria) this;
        }

        public Criteria andCreatedTimeIsNotNull() {
            addCriterion("WPWX_USER_PUBLIC_STATUS.created_time is not null");
            return (Criteria) this;
        }

        public Criteria andCreatedTimeEqualTo(Date value) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.created_time =", value, "createdTime");
            return (Criteria) this;
        }

        public Criteria andCreatedTimeNotEqualTo(Date value) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.created_time <>", value, "createdTime");
            return (Criteria) this;
        }

        public Criteria andCreatedTimeGreaterThan(Date value) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.created_time >", value, "createdTime");
            return (Criteria) this;
        }

        public Criteria andCreatedTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.created_time >=", value, "createdTime");
            return (Criteria) this;
        }

        public Criteria andCreatedTimeLessThan(Date value) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.created_time <", value, "createdTime");
            return (Criteria) this;
        }

        public Criteria andCreatedTimeLessThanOrEqualTo(Date value) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.created_time <=", value, "createdTime");
            return (Criteria) this;
        }

        public Criteria andCreatedTimeIn(List<Date> values) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.created_time in", values, "createdTime");
            return (Criteria) this;
        }

        public Criteria andCreatedTimeNotIn(List<Date> values) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.created_time not in", values, "createdTime");
            return (Criteria) this;
        }

        public Criteria andCreatedTimeBetween(Date value1, Date value2) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.created_time between", value1, value2, "createdTime");
            return (Criteria) this;
        }

        public Criteria andCreatedTimeNotBetween(Date value1, Date value2) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.created_time not between", value1, value2, "createdTime");
            return (Criteria) this;
        }

        public Criteria andUpdatedTimeIsNull() {
            addCriterion("WPWX_USER_PUBLIC_STATUS.updated_time is null");
            return (Criteria) this;
        }

        public Criteria andUpdatedTimeIsNotNull() {
            addCriterion("WPWX_USER_PUBLIC_STATUS.updated_time is not null");
            return (Criteria) this;
        }

        public Criteria andUpdatedTimeEqualTo(Date value) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.updated_time =", value, "updatedTime");
            return (Criteria) this;
        }

        public Criteria andUpdatedTimeNotEqualTo(Date value) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.updated_time <>", value, "updatedTime");
            return (Criteria) this;
        }

        public Criteria andUpdatedTimeGreaterThan(Date value) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.updated_time >", value, "updatedTime");
            return (Criteria) this;
        }

        public Criteria andUpdatedTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.updated_time >=", value, "updatedTime");
            return (Criteria) this;
        }

        public Criteria andUpdatedTimeLessThan(Date value) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.updated_time <", value, "updatedTime");
            return (Criteria) this;
        }

        public Criteria andUpdatedTimeLessThanOrEqualTo(Date value) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.updated_time <=", value, "updatedTime");
            return (Criteria) this;
        }

        public Criteria andUpdatedTimeIn(List<Date> values) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.updated_time in", values, "updatedTime");
            return (Criteria) this;
        }

        public Criteria andUpdatedTimeNotIn(List<Date> values) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.updated_time not in", values, "updatedTime");
            return (Criteria) this;
        }

        public Criteria andUpdatedTimeBetween(Date value1, Date value2) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.updated_time between", value1, value2, "updatedTime");
            return (Criteria) this;
        }

        public Criteria andUpdatedTimeNotBetween(Date value1, Date value2) {
            addCriterion("WPWX_USER_PUBLIC_STATUS.updated_time not between", value1, value2, "updatedTime");
            return (Criteria) this;
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table wpwx_user_public_status
     *
     * @mbggenerated do_not_delete_during_merge
     */
    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table wpwx_user_public_status
     *
     * @mbggenerated
     */
    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}