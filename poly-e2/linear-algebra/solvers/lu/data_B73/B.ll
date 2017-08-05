; ModuleID = 'A.ll'
source_filename = "lu.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %arraydecay = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_lu(i32 2000, [2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %n, [2000 x double]* %A) unnamed_addr #0 {
entry:
  %A.addr = alloca [2000 x double]*, align 8
  %B = alloca [2000 x [2000 x double]]*, align 8
  store [2000 x double]* %A, [2000 x double]** %A.addr, align 8
  %.pre = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.inc.lr.ph

for.inc.lr.ph:                                    ; preds = %for.inc23.for.inc.lr.ph_crit_edge, %entry
  %indvars.iv124 = phi i64 [ 0, %entry ], [ %indvars.iv.next125, %for.inc23.for.inc.lr.ph_crit_edge ]
  %indvars.iv122 = phi i64 [ 1, %entry ], [ %indvars.iv.next123, %for.inc23.for.inc.lr.ph_crit_edge ]
  %0 = phi [2000 x double]* [ %A, %entry ], [ %.pre, %for.inc23.for.inc.lr.ph_crit_edge ]
  br label %for.inc

for.cond8.preheader:                              ; preds = %for.inc
  %indvars.iv.next125 = add nuw nsw i64 %indvars.iv124, 1
  %cmp970 = icmp slt i64 %indvars.iv.next125, 2000
  br i1 %cmp970, label %for.inc16.lr.ph, label %for.inc23

for.inc16.lr.ph:                                  ; preds = %for.cond8.preheader
  br label %for.inc16

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph
  %indvars.iv109 = phi i64 [ 0, %for.inc.lr.ph ], [ %indvars.iv.next110, %for.inc ]
  %1 = sub nsw i64 0, %indvars.iv109
  %2 = trunc i64 %1 to i32
  %rem = srem i32 %2, 2000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 2.000000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv124, i64 %indvars.iv109
  store double %add, double* %arrayidx6, align 8
  %indvars.iv.next110 = add nuw nsw i64 %indvars.iv109, 1
  %exitcond115 = icmp eq i64 %indvars.iv.next110, %indvars.iv122
  br i1 %exitcond115, label %for.cond8.preheader, label %for.inc

for.inc16:                                        ; preds = %for.inc16.for.inc16_crit_edge, %for.inc16.lr.ph
  %indvars.iv118 = phi i64 [ %indvars.iv122, %for.inc16.lr.ph ], [ %indvars.iv.next119, %for.inc16.for.inc16_crit_edge ]
  %arrayidx15 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv124, i64 %indvars.iv118
  store double 0.000000e+00, double* %arrayidx15, align 8
  %exitcond130 = icmp eq i64 %indvars.iv118, 1999
  br i1 %exitcond130, label %for.inc23.loopexit, label %for.inc16.for.inc16_crit_edge

for.inc16.for.inc16_crit_edge:                    ; preds = %for.inc16
  %indvars.iv.next119 = add nuw nsw i64 %indvars.iv118, 1
  br label %for.inc16

for.inc23.loopexit:                               ; preds = %for.inc16
  br label %for.inc23

for.inc23:                                        ; preds = %for.inc23.loopexit, %for.cond8.preheader
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv124, i64 %indvars.iv124
  store double 1.000000e+00, double* %arrayidx22, align 8
  %exitcond127 = icmp eq i64 %indvars.iv.next125, 2000
  br i1 %exitcond127, label %for.end25, label %for.inc23.for.inc.lr.ph_crit_edge

for.inc23.for.inc.lr.ph_crit_edge:                ; preds = %for.inc23
  %indvars.iv.next123 = add nuw nsw i64 %indvars.iv122, 1
  br label %for.inc.lr.ph

for.end25:                                        ; preds = %for.inc23
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %3 = bitcast [2000 x [2000 x double]]** %B to i8**
  store i8* %call, i8** %3, align 8
  %4 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond30.for.inc41_crit_edge.us

for.cond30.for.inc41_crit_edge.us:                ; preds = %for.cond30.for.inc41_crit_edge.us.for.cond30.for.inc41_crit_edge.us_crit_edge, %for.end25
  %indvars.iv105 = phi i64 [ 0, %for.end25 ], [ %indvars.iv.next106, %for.cond30.for.inc41_crit_edge.us.for.cond30.for.inc41_crit_edge.us_crit_edge ]
  %5 = mul nuw nsw i64 %indvars.iv105, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %5
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %exitcond129 = icmp eq i64 %indvars.iv105, 1999
  br i1 %exitcond129, label %for.cond48.preheader.us.preheader, label %for.cond30.for.inc41_crit_edge.us.for.cond30.for.inc41_crit_edge.us_crit_edge

for.cond30.for.inc41_crit_edge.us.for.cond30.for.inc41_crit_edge.us_crit_edge: ; preds = %for.cond30.for.inc41_crit_edge.us
  %indvars.iv.next106 = add nuw nsw i64 %indvars.iv105, 1
  br label %for.cond30.for.inc41_crit_edge.us

for.cond48.preheader.us.preheader:                ; preds = %for.cond30.for.inc41_crit_edge.us
  br label %for.cond52.preheader.us.us.preheader

for.cond52.preheader.us.us.preheader:             ; preds = %for.cond48.for.inc75_crit_edge.us, %for.cond48.preheader.us.preheader
  %indvars.iv97 = phi i64 [ 0, %for.cond48.preheader.us.preheader ], [ %indvars.iv.next98, %for.cond48.for.inc75_crit_edge.us ]
  br label %for.cond52.preheader.us.us

for.cond48.for.inc75_crit_edge.us:                ; preds = %for.cond52.for.inc72_crit_edge.us.us
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97, 1
  %exitcond135 = icmp eq i64 %indvars.iv.next98, 2000
  br i1 %exitcond135, label %for.cond82.preheader.us.preheader, label %for.cond52.preheader.us.us.preheader

for.cond52.preheader.us.us:                       ; preds = %for.cond52.for.inc72_crit_edge.us.us, %for.cond52.preheader.us.us.preheader
  %indvars.iv93 = phi i64 [ 0, %for.cond52.preheader.us.us.preheader ], [ %indvars.iv.next94, %for.cond52.for.inc72_crit_edge.us.us ]
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv93, i64 %indvars.iv97
  br label %for.inc69.us.us

for.cond52.for.inc72_crit_edge.us.us:             ; preds = %for.inc69.us.us
  %indvars.iv.next94 = add nuw nsw i64 %indvars.iv93, 1
  %exitcond134 = icmp eq i64 %indvars.iv.next94, 2000
  br i1 %exitcond134, label %for.cond48.for.inc75_crit_edge.us, label %for.cond52.preheader.us.us

for.inc69.us.us:                                  ; preds = %for.inc69.us.us.for.inc69.us.us_crit_edge, %for.cond52.preheader.us.us
  %indvars.iv89 = phi i64 [ %indvars.iv.next90, %for.inc69.us.us.for.inc69.us.us_crit_edge ], [ 0, %for.cond52.preheader.us.us ]
  %6 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv89, i64 %indvars.iv97
  %7 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %6, %7
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %4, i64 0, i64 %indvars.iv93, i64 %indvars.iv89
  %8 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %mul.us.us, %8
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %exitcond = icmp eq i64 %indvars.iv89, 1999
  br i1 %exitcond, label %for.cond52.for.inc72_crit_edge.us.us, label %for.inc69.us.us.for.inc69.us.us_crit_edge

for.inc69.us.us.for.inc69.us.us_crit_edge:        ; preds = %for.inc69.us.us
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1
  br label %for.inc69.us.us

for.cond82.preheader.us.preheader:                ; preds = %for.cond48.for.inc75_crit_edge.us
  %9 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %B, align 8
  %10 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.cond82.preheader.us

for.cond82.preheader.us:                          ; preds = %for.cond82.for.inc97_crit_edge.us.1, %for.cond82.preheader.us.preheader
  %indvars.iv85 = phi i64 [ 0, %for.cond82.preheader.us.preheader ], [ %indvars.iv.next86.1, %for.cond82.for.inc97_crit_edge.us.1 ]
  br label %for.inc94.us

for.inc94.us:                                     ; preds = %for.inc94.us.for.inc94.us_crit_edge, %for.cond82.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond82.preheader.us ], [ %indvars.iv.next, %for.inc94.us.for.inc94.us_crit_edge ]
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %9, i64 0, i64 %indvars.iv85, i64 %indvars.iv
  %11 = bitcast double* %arrayidx89.us to i64*
  %12 = load i64, i64* %11, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %10, i64 %indvars.iv85, i64 %indvars.iv
  %13 = bitcast double* %arrayidx93.us to i64*
  store i64 %12, i64* %13, align 8
  %exitcond128 = icmp eq i64 %indvars.iv, 1999
  br i1 %exitcond128, label %for.cond82.for.inc97_crit_edge.us, label %for.inc94.us.for.inc94.us_crit_edge

for.inc94.us.for.inc94.us_crit_edge:              ; preds = %for.inc94.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.inc94.us

for.cond82.for.inc97_crit_edge.us:                ; preds = %for.inc94.us
  %indvars.iv.next86 = or i64 %indvars.iv85, 1
  br label %for.inc94.us.1

for.end99.loopexit:                               ; preds = %for.cond82.for.inc97_crit_edge.us.1
  %14 = bitcast [2000 x [2000 x double]]* %9 to i8*
  tail call void @free(i8* %14) #4
  ret void

for.inc94.us.1:                                   ; preds = %for.inc94.us.for.inc94.us_crit_edge.1, %for.cond82.for.inc97_crit_edge.us
  %indvars.iv.1 = phi i64 [ 0, %for.cond82.for.inc97_crit_edge.us ], [ %indvars.iv.next.1, %for.inc94.us.for.inc94.us_crit_edge.1 ]
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %9, i64 0, i64 %indvars.iv.next86, i64 %indvars.iv.1
  %15 = bitcast double* %arrayidx89.us.1 to i64*
  %16 = load i64, i64* %15, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %10, i64 %indvars.iv.next86, i64 %indvars.iv.1
  %17 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %16, i64* %17, align 8
  %exitcond128.1 = icmp eq i64 %indvars.iv.1, 1999
  br i1 %exitcond128.1, label %for.cond82.for.inc97_crit_edge.us.1, label %for.inc94.us.for.inc94.us_crit_edge.1

for.inc94.us.for.inc94.us_crit_edge.1:            ; preds = %for.inc94.us.1
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv.1, 1
  br label %for.inc94.us.1

for.cond82.for.inc97_crit_edge.us.1:              ; preds = %for.inc94.us.1
  %indvars.iv.next86.1 = add nsw i64 %indvars.iv85, 2
  %exitcond133.1 = icmp eq i64 %indvars.iv.next86.1, 2000
  br i1 %exitcond133.1, label %for.end99.loopexit, label %for.cond82.preheader.us
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32 %n, [2000 x double]* nocapture %A) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc54, %entry
  %indvars.iv53 = phi i64 [ 0, %entry ], [ %indvars.iv.next54, %for.inc54 ]
  %cmp212 = icmp sgt i64 %indvars.iv53, 0
  br i1 %cmp212, label %for.cond4.preheader.preheader, label %for.inc54

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv53, i64 0
  br label %for.cond4.preheader

for.cond31.preheader.lr.ph:                       ; preds = %for.inc25
  br i1 true, label %for.cond31.preheader.us.preheader, label %for.cond31.preheader.lr.ph.for.inc54_crit_edge

for.cond31.preheader.lr.ph.for.inc54_crit_edge:   ; preds = %for.cond31.preheader.lr.ph
  br label %for.inc54

for.cond31.preheader.us.preheader:                ; preds = %for.cond31.preheader.lr.ph
  %xtraiter59 = and i64 %indvars.iv53, 1
  %lcmp.mod60 = icmp eq i64 %xtraiter59, 0
  %0 = icmp eq i64 %indvars.iv53, 1
  %arrayidx37.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv53, i64 0
  br label %for.cond31.preheader.us

for.cond31.preheader.us:                          ; preds = %for.cond31.preheader.us.preheader, %for.cond31.for.inc51_crit_edge.us
  %indvars.iv49 = phi i64 [ %indvars.iv.next50, %for.cond31.for.inc51_crit_edge.us ], [ %indvars.iv53, %for.cond31.preheader.us.preheader ]
  %arrayidx46.us.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv53, i64 %indvars.iv49
  %.pre31 = load double, double* %arrayidx46.us.phi.trans.insert, align 8
  br i1 %lcmp.mod60, label %for.inc48.us.prol.loopexit.unr-lcssa, label %for.inc48.us.prol.preheader

for.inc48.us.prol.preheader:                      ; preds = %for.cond31.preheader.us
  br label %for.inc48.us.prol

for.inc48.us.prol:                                ; preds = %for.inc48.us.prol.preheader
  %1 = load double, double* %arrayidx37.us.prol, align 8
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv49
  %2 = load double, double* %arrayidx41.us.prol, align 8
  %mul42.us.prol = fmul double %1, %2
  %sub47.us.prol = fsub double %.pre31, %mul42.us.prol
  store double %sub47.us.prol, double* %arrayidx46.us.phi.trans.insert, align 8
  br label %for.inc48.us.prol.loopexit.unr-lcssa

for.inc48.us.prol.loopexit.unr-lcssa:             ; preds = %for.cond31.preheader.us, %for.inc48.us.prol
  %indvars.iv42.unr.ph = phi i64 [ 1, %for.inc48.us.prol ], [ 0, %for.cond31.preheader.us ]
  %.unr61.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ %.pre31, %for.cond31.preheader.us ]
  br label %for.inc48.us.prol.loopexit

for.inc48.us.prol.loopexit:                       ; preds = %for.inc48.us.prol.loopexit.unr-lcssa
  br i1 %0, label %for.cond31.for.inc51_crit_edge.us, label %for.cond31.preheader.us.new

for.cond31.preheader.us.new:                      ; preds = %for.inc48.us.prol.loopexit
  br label %for.inc48.us

for.inc48.us:                                     ; preds = %for.inc48.us, %for.cond31.preheader.us.new
  %indvars.iv42 = phi i64 [ %indvars.iv42.unr.ph, %for.cond31.preheader.us.new ], [ %indvars.iv.next43.1, %for.inc48.us ]
  %3 = phi double [ %.unr61.ph, %for.cond31.preheader.us.new ], [ %sub47.us.1, %for.inc48.us ]
  %arrayidx37.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv53, i64 %indvars.iv42
  %4 = load double, double* %arrayidx37.us, align 8
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv42, i64 %indvars.iv49
  %5 = load double, double* %arrayidx41.us, align 8
  %mul42.us = fmul double %4, %5
  %sub47.us = fsub double %3, %mul42.us
  store double %sub47.us, double* %arrayidx46.us.phi.trans.insert, align 8
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %arrayidx37.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv53, i64 %indvars.iv.next43
  %6 = load double, double* %arrayidx37.us.1, align 8
  %arrayidx41.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next43, i64 %indvars.iv49
  %7 = load double, double* %arrayidx41.us.1, align 8
  %mul42.us.1 = fmul double %6, %7
  %sub47.us.1 = fsub double %sub47.us, %mul42.us.1
  store double %sub47.us.1, double* %arrayidx46.us.phi.trans.insert, align 8
  %indvars.iv.next43.1 = add nsw i64 %indvars.iv42, 2
  %exitcond46.1 = icmp eq i64 %indvars.iv.next43.1, %indvars.iv53
  br i1 %exitcond46.1, label %for.cond31.for.inc51_crit_edge.us.unr-lcssa, label %for.inc48.us

for.cond31.for.inc51_crit_edge.us.unr-lcssa:      ; preds = %for.inc48.us
  br label %for.cond31.for.inc51_crit_edge.us

for.cond31.for.inc51_crit_edge.us:                ; preds = %for.inc48.us.prol.loopexit, %for.cond31.for.inc51_crit_edge.us.unr-lcssa
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond57 = icmp eq i64 %indvars.iv.next50, 2000
  br i1 %exitcond57, label %for.inc54.loopexit, label %for.cond31.preheader.us

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.inc25
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %for.inc25 ], [ 0, %for.cond4.preheader.preheader ]
  %cmp58 = icmp sgt i64 %indvars.iv35, 0
  %arrayidx16.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv53, i64 %indvars.iv35
  %.pre = load double, double* %arrayidx16.phi.trans.insert, align 8
  br i1 %cmp58, label %for.inc.preheader, label %for.inc25

for.inc.preheader:                                ; preds = %for.cond4.preheader
  %xtraiter = and i64 %indvars.iv35, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.prol.loopexit.unr-lcssa, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.preheader
  br label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.prol.preheader
  %8 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv35
  %9 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %8, %9
  %sub.prol = fsub double %.pre, %mul.prol
  store double %sub.prol, double* %arrayidx16.phi.trans.insert, align 8
  br label %for.inc.prol.loopexit.unr-lcssa

for.inc.prol.loopexit.unr-lcssa:                  ; preds = %for.inc.preheader, %for.inc.prol
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ undef, %for.inc.preheader ]
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.prol ], [ 0, %for.inc.preheader ]
  %.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ %.pre, %for.inc.preheader ]
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol.loopexit.unr-lcssa
  %10 = icmp eq i64 %indvars.iv35, 1
  br i1 %10, label %for.inc25.loopexit, label %for.inc.preheader.new

for.inc.preheader.new:                            ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.inc.preheader.new ], [ %indvars.iv.next.1, %for.inc ]
  %11 = phi double [ %.unr.ph, %for.inc.preheader.new ], [ %sub.1, %for.inc ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv53, i64 %indvars.iv
  %12 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv35
  %13 = load double, double* %arrayidx12, align 8
  %mul = fmul double %12, %13
  %sub = fsub double %11, %mul
  store double %sub, double* %arrayidx16.phi.trans.insert, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv53, i64 %indvars.iv.next
  %14 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv35
  %15 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %14, %15
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16.phi.trans.insert, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv35
  br i1 %exitcond.1, label %for.inc25.loopexit.unr-lcssa, label %for.inc

for.inc25.loopexit.unr-lcssa:                     ; preds = %for.inc
  br label %for.inc25.loopexit

for.inc25.loopexit:                               ; preds = %for.inc.prol.loopexit, %for.inc25.loopexit.unr-lcssa
  %sub.lcssa = phi double [ %sub.lcssa.unr.ph, %for.inc.prol.loopexit ], [ %sub.1, %for.inc25.loopexit.unr-lcssa ]
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.loopexit, %for.cond4.preheader
  %16 = phi double [ %.pre, %for.cond4.preheader ], [ %sub.lcssa, %for.inc25.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv35, i64 %indvars.iv35
  %17 = load double, double* %arrayidx20, align 8
  %div = fdiv double %16, %17
  store double %div, double* %arrayidx16.phi.trans.insert, align 8
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next36, %indvars.iv53
  br i1 %exitcond40, label %for.cond31.preheader.lr.ph, label %for.cond4.preheader

for.inc54.loopexit:                               ; preds = %for.cond31.for.inc51_crit_edge.us
  br label %for.inc54

for.inc54:                                        ; preds = %for.cond31.preheader.lr.ph.for.inc54_crit_edge, %for.inc54.loopexit, %for.cond1.preheader
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond58 = icmp eq i64 %indvars.iv.next54, 2000
  br i1 %exitcond58, label %for.end56, label %for.cond1.preheader

for.end56:                                        ; preds = %for.inc54
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [2000 x double]* nocapture readonly %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %entry
  %indvars.iv10 = phi i64 [ 0, %entry ], [ %indvars.iv.next11, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nuw nsw i64 %indvars.iv10, 2000
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %for.inc.us ]
  %4 = add nuw nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv10, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond15, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond = icmp eq i64 %indvars.iv.next11, 2000
  br i1 %exitcond, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
