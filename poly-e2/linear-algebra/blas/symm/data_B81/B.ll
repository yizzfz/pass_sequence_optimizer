; ModuleID = 'A.ll'
source_filename = "symm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay3 = bitcast i8* %call1 to [1000 x double]*
  %arraydecay4 = bitcast i8* %call2 to [1200 x double]*
  call void @init_array(i32 1000, i32 1200, double* nonnull %alpha, double* nonnull %beta, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  call void @kernel_symm(i32 1000, i32 1200, double %0, double %1, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %entry.if.end_crit_edge

entry.if.end_crit_edge:                           ; preds = %entry
  br label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %2, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %land.lhs.true.if.end_crit_edge

land.lhs.true.if.end_crit_edge:                   ; preds = %land.lhs.true
  br label %if.end

if.then:                                          ; preds = %land.lhs.true
  %3 = bitcast i8* %call to [1200 x double]*
  call void @print_array(i32 1000, i32 1200, [1200 x double]* %3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true.if.end_crit_edge, %entry.if.end_crit_edge, %if.then
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32 %m, i32 %n, double* nocapture %alpha, double* nocapture %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture %A, [1200 x double]* nocapture %B) #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc16_crit_edge.us.for.cond1.preheader.us_crit_edge, %entry
  %indvars.iv29 = phi i64 [ 0, %entry ], [ %indvars.iv.next30, %for.cond1.for.inc16_crit_edge.us.for.cond1.preheader.us_crit_edge ]
  %0 = add i64 %indvars.iv29, 1200
  %1 = trunc i64 %0 to i32
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.for.body3.us_crit_edge, %for.cond1.preheader.us
  %indvars.iv25 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next26, %for.body3.us.for.body3.us_crit_edge ]
  %2 = add nuw nsw i64 %indvars.iv25, %indvars.iv29
  %3 = trunc i64 %2 to i32
  %rem.us = srem i32 %3, 100
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.000000e+03
  %arrayidx6.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv29, i64 %indvars.iv25
  store double %div.us, double* %arrayidx6.us, align 8
  %4 = trunc i64 %indvars.iv25 to i32
  %sub.us = sub i32 %1, %4
  %rem8.us = srem i32 %sub.us, 100
  %conv9.us = sitofp i32 %rem8.us to double
  %div11.us = fdiv double %conv9.us, 1.000000e+03
  %arrayidx15.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv29, i64 %indvars.iv25
  store double %div11.us, double* %arrayidx15.us, align 8
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next26, 1200
  br i1 %exitcond28, label %for.cond1.for.inc16_crit_edge.us, label %for.body3.us.for.body3.us_crit_edge

for.body3.us.for.body3.us_crit_edge:              ; preds = %for.body3.us
  br label %for.body3.us

for.cond1.for.inc16_crit_edge.us:                 ; preds = %for.body3.us
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next30, 1000
  br i1 %exitcond33, label %for.body26.lr.ph.preheader, label %for.cond1.for.inc16_crit_edge.us.for.cond1.preheader.us_crit_edge

for.cond1.for.inc16_crit_edge.us.for.cond1.preheader.us_crit_edge: ; preds = %for.cond1.for.inc16_crit_edge.us
  br label %for.cond1.preheader.us

for.body26.lr.ph.preheader:                       ; preds = %for.cond1.for.inc16_crit_edge.us
  br label %for.body26.lr.ph

for.cond19.loopexit.loopexit:                     ; preds = %for.body43
  br label %for.cond19.loopexit

for.cond19.loopexit:                              ; preds = %middle.block.for.cond19.loopexit_crit_edge, %for.body43.prol.loopexit.for.cond19.loopexit_crit_edge, %for.end38.for.cond19.loopexit_crit_edge, %for.cond19.loopexit.loopexit
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond = icmp eq i64 %indvars.iv.next23, 1000
  br i1 %exitcond, label %for.end53, label %for.cond19.loopexit.for.body26.lr.ph_crit_edge

for.cond19.loopexit.for.body26.lr.ph_crit_edge:   ; preds = %for.cond19.loopexit
  br label %for.body26.lr.ph

for.body26.lr.ph:                                 ; preds = %for.cond19.loopexit.for.body26.lr.ph_crit_edge, %for.body26.lr.ph.preheader
  %indvars.iv22 = phi i64 [ %indvars.iv.next23, %for.cond19.loopexit.for.body26.lr.ph_crit_edge ], [ 0, %for.body26.lr.ph.preheader ]
  %indvars.iv20 = phi i64 [ %indvars.iv.next21, %for.cond19.loopexit.for.body26.lr.ph_crit_edge ], [ 1, %for.body26.lr.ph.preheader ]
  %5 = sub nsw i64 0, %indvars.iv22
  %6 = trunc i64 %5 to i32
  %7 = add i32 %6, 7
  %8 = add i32 %6, 998
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %xtraiter35 = and i64 %indvars.iv.next23, 1
  %lcmp.mod = icmp eq i64 %xtraiter35, 0
  br i1 %lcmp.mod, label %for.body26.lr.ph.for.body26.prol.loopexit.unr-lcssa_crit_edge, label %for.body26.prol.preheader

for.body26.lr.ph.for.body26.prol.loopexit.unr-lcssa_crit_edge: ; preds = %for.body26.lr.ph
  br label %for.body26.prol.loopexit.unr-lcssa

for.body26.prol.preheader:                        ; preds = %for.body26.lr.ph
  %9 = trunc i64 %indvars.iv22 to i32
  %rem28.prol = srem i32 %9, 100
  %conv29.prol = sitofp i32 %rem28.prol to double
  %div31.prol = fdiv double %conv29.prol, 1.000000e+03
  %arrayidx35.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv22, i64 0
  store double %div31.prol, double* %arrayidx35.prol, align 8
  br label %for.body26.prol.loopexit.unr-lcssa

for.body26.prol.loopexit.unr-lcssa:               ; preds = %for.body26.lr.ph.for.body26.prol.loopexit.unr-lcssa_crit_edge, %for.body26.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body26.prol.preheader ], [ 0, %for.body26.lr.ph.for.body26.prol.loopexit.unr-lcssa_crit_edge ]
  %10 = icmp eq i64 %indvars.iv22, 0
  br i1 %10, label %for.body26.prol.loopexit.unr-lcssa.for.end38_crit_edge, label %for.body26.preheader

for.body26.prol.loopexit.unr-lcssa.for.end38_crit_edge: ; preds = %for.body26.prol.loopexit.unr-lcssa
  br label %for.end38

for.body26.preheader:                             ; preds = %for.body26.prol.loopexit.unr-lcssa
  br label %for.body26

for.body26:                                       ; preds = %for.body26.for.body26_crit_edge, %for.body26.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body26.for.body26_crit_edge ], [ %indvars.iv.unr.ph, %for.body26.preheader ]
  %11 = add nuw nsw i64 %indvars.iv, %indvars.iv22
  %12 = trunc i64 %11 to i32
  %rem28 = srem i32 %12, 100
  %conv29 = sitofp i32 %rem28 to double
  %div31 = fdiv double %conv29, 1.000000e+03
  %arrayidx35 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv22, i64 %indvars.iv
  store double %div31, double* %arrayidx35, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %13 = add nuw nsw i64 %indvars.iv.next, %indvars.iv22
  %14 = trunc i64 %13 to i32
  %rem28.1 = srem i32 %14, 100
  %conv29.1 = sitofp i32 %rem28.1 to double
  %div31.1 = fdiv double %conv29.1, 1.000000e+03
  %arrayidx35.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv22, i64 %indvars.iv.next
  store double %div31.1, double* %arrayidx35.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv20
  br i1 %exitcond.1, label %for.end38.loopexit, label %for.body26.for.body26_crit_edge

for.body26.for.body26_crit_edge:                  ; preds = %for.body26
  br label %for.body26

for.end38.loopexit:                               ; preds = %for.body26
  br label %for.end38

for.end38:                                        ; preds = %for.body26.prol.loopexit.unr-lcssa.for.end38_crit_edge, %for.end38.loopexit
  %cmp412 = icmp slt i64 %indvars.iv.next23, 1000
  br i1 %cmp412, label %for.body43.lr.ph, label %for.end38.for.cond19.loopexit_crit_edge

for.end38.for.cond19.loopexit_crit_edge:          ; preds = %for.end38
  br label %for.cond19.loopexit

for.body43.lr.ph:                                 ; preds = %for.end38
  %xtraiter16 = and i32 %7, 7
  %lcmp.mod17 = icmp eq i32 %xtraiter16, 0
  br i1 %lcmp.mod17, label %for.body43.lr.ph.for.body43.prol.loopexit_crit_edge, label %for.body43.prol.preheader

for.body43.lr.ph.for.body43.prol.loopexit_crit_edge: ; preds = %for.body43.lr.ph
  br label %for.body43.prol.loopexit

for.body43.prol.preheader:                        ; preds = %for.body43.lr.ph
  br label %for.body43.prol

for.body43.prol:                                  ; preds = %for.body43.prol.for.body43.prol_crit_edge, %for.body43.prol.preheader
  %indvars.iv13.prol = phi i64 [ %indvars.iv.next14.prol, %for.body43.prol.for.body43.prol_crit_edge ], [ %indvars.iv20, %for.body43.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body43.prol.for.body43.prol_crit_edge ], [ %xtraiter16, %for.body43.prol.preheader ]
  %arrayidx47.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv22, i64 %indvars.iv13.prol
  store double -9.990000e+02, double* %arrayidx47.prol, align 8
  %indvars.iv.next14.prol = add nuw nsw i64 %indvars.iv13.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body43.prol.loopexit.loopexit, label %for.body43.prol.for.body43.prol_crit_edge, !llvm.loop !1

for.body43.prol.for.body43.prol_crit_edge:        ; preds = %for.body43.prol
  br label %for.body43.prol

for.body43.prol.loopexit.loopexit:                ; preds = %for.body43.prol
  br label %for.body43.prol.loopexit

for.body43.prol.loopexit:                         ; preds = %for.body43.lr.ph.for.body43.prol.loopexit_crit_edge, %for.body43.prol.loopexit.loopexit
  %indvars.iv13.unr = phi i64 [ %indvars.iv20, %for.body43.lr.ph.for.body43.prol.loopexit_crit_edge ], [ %indvars.iv.next14.prol, %for.body43.prol.loopexit.loopexit ]
  %15 = icmp ult i32 %8, 7
  br i1 %15, label %for.body43.prol.loopexit.for.cond19.loopexit_crit_edge, label %for.body43.preheader

for.body43.prol.loopexit.for.cond19.loopexit_crit_edge: ; preds = %for.body43.prol.loopexit
  br label %for.cond19.loopexit

for.body43.preheader:                             ; preds = %for.body43.prol.loopexit
  %16 = sub i64 992, %indvars.iv13.unr
  %17 = lshr i64 %16, 3
  %18 = add nuw nsw i64 %17, 1
  %min.iters.check = icmp ult i64 %18, 2
  br i1 %min.iters.check, label %for.body43.preheader.for.body43.preheader37_crit_edge, label %min.iters.checked

for.body43.preheader.for.body43.preheader37_crit_edge: ; preds = %for.body43.preheader
  br label %for.body43.preheader37

min.iters.checked:                                ; preds = %for.body43.preheader
  %n.mod.vf = and i64 %18, 1
  %n.vec = sub nsw i64 %18, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %19 = add i64 %indvars.iv13.unr, 8
  %20 = shl nuw i64 %17, 3
  %21 = add i64 %19, %20
  %22 = shl nuw nsw i64 %n.mod.vf, 3
  %ind.end = sub i64 %21, %22
  br i1 %cmp.zero, label %min.iters.checked.for.body43.preheader37_crit_edge, label %vector.body.preheader

min.iters.checked.for.body43.preheader37_crit_edge: ; preds = %min.iters.checked
  br label %for.body43.preheader37

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %23 = shl i64 %index, 3
  %24 = add i64 %indvars.iv13.unr, %23
  %25 = add nsw i64 %24, 7
  %26 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv22, i64 %25
  %27 = getelementptr double, double* %26, i64 -7
  %28 = bitcast double* %27 to <16 x double>*
  store <16 x double> <double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02>, <16 x double>* %28, align 8
  %index.next = add i64 %index, 2
  %29 = icmp eq i64 %index.next, %n.vec
  br i1 %29, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !3

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %middle.block.for.cond19.loopexit_crit_edge, label %middle.block.for.body43.preheader37_crit_edge

middle.block.for.body43.preheader37_crit_edge:    ; preds = %middle.block
  br label %for.body43.preheader37

middle.block.for.cond19.loopexit_crit_edge:       ; preds = %middle.block
  br label %for.cond19.loopexit

for.body43.preheader37:                           ; preds = %middle.block.for.body43.preheader37_crit_edge, %min.iters.checked.for.body43.preheader37_crit_edge, %for.body43.preheader.for.body43.preheader37_crit_edge
  %indvars.iv13.ph = phi i64 [ %indvars.iv13.unr, %min.iters.checked.for.body43.preheader37_crit_edge ], [ %indvars.iv13.unr, %for.body43.preheader.for.body43.preheader37_crit_edge ], [ %ind.end, %middle.block.for.body43.preheader37_crit_edge ]
  br label %for.body43

for.body43:                                       ; preds = %for.body43.for.body43_crit_edge, %for.body43.preheader37
  %indvars.iv13 = phi i64 [ %indvars.iv.next14.7, %for.body43.for.body43_crit_edge ], [ %indvars.iv13.ph, %for.body43.preheader37 ]
  %arrayidx47 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv22, i64 %indvars.iv13
  store double -9.990000e+02, double* %arrayidx47, align 8
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %arrayidx47.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv22, i64 %indvars.iv.next14
  store double -9.990000e+02, double* %arrayidx47.1, align 8
  %indvars.iv.next14.1 = add nsw i64 %indvars.iv13, 2
  %arrayidx47.2 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv22, i64 %indvars.iv.next14.1
  store double -9.990000e+02, double* %arrayidx47.2, align 8
  %indvars.iv.next14.2 = add nsw i64 %indvars.iv13, 3
  %arrayidx47.3 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv22, i64 %indvars.iv.next14.2
  store double -9.990000e+02, double* %arrayidx47.3, align 8
  %indvars.iv.next14.3 = add nsw i64 %indvars.iv13, 4
  %arrayidx47.4 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv22, i64 %indvars.iv.next14.3
  store double -9.990000e+02, double* %arrayidx47.4, align 8
  %indvars.iv.next14.4 = add nsw i64 %indvars.iv13, 5
  %arrayidx47.5 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv22, i64 %indvars.iv.next14.4
  store double -9.990000e+02, double* %arrayidx47.5, align 8
  %indvars.iv.next14.5 = add nsw i64 %indvars.iv13, 6
  %arrayidx47.6 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv22, i64 %indvars.iv.next14.5
  store double -9.990000e+02, double* %arrayidx47.6, align 8
  %indvars.iv.next14.6 = add nsw i64 %indvars.iv13, 7
  %arrayidx47.7 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv22, i64 %indvars.iv.next14.6
  store double -9.990000e+02, double* %arrayidx47.7, align 8
  %indvars.iv.next14.7 = add nsw i64 %indvars.iv13, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next14.7, 1000
  br i1 %exitcond.7, label %for.cond19.loopexit.loopexit, label %for.body43.for.body43_crit_edge, !llvm.loop !6

for.body43.for.body43_crit_edge:                  ; preds = %for.body43
  br label %for.body43

for.end53:                                        ; preds = %for.cond19.loopexit
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_symm(i32 %m, i32 %n, double %alpha, double %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture readonly %A, [1200 x double]* nocapture readonly %B) #2 {
entry:
  %mul44.us18 = fmul double %alpha, 0.000000e+00
  %broadcast.splatinsert78 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat79 = shufflevector <2 x double> %broadcast.splatinsert78, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert82 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat83 = shufflevector <2 x double> %broadcast.splatinsert82, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert84 = insertelement <2 x double> undef, double %mul44.us18, i32 0
  %broadcast.splat85 = shufflevector <2 x double> %broadcast.splatinsert84, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc53_crit_edge.us.for.cond1.preheader.us_crit_edge, %entry
  %indvars.iv58 = phi i64 [ 0, %entry ], [ %indvars.iv.next59, %for.cond1.for.inc53_crit_edge.us.for.cond1.preheader.us_crit_edge ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv58, i64 0
  %0 = add i64 %indvars.iv58, 1
  %scevgep66 = getelementptr [1200 x double], [1200 x double]* %C, i64 %0, i64 0
  %cmp51.us = icmp sgt i64 %indvars.iv58, 0
  %arrayidx41.us.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv58
  br i1 %cmp51.us, label %for.cond4.preheader.us.us.preheader, label %vector.memcheck

for.cond4.preheader.us.us.preheader:              ; preds = %for.cond1.preheader.us
  br label %for.cond4.preheader.us.us

vector.memcheck:                                  ; preds = %for.cond1.preheader.us
  %scevgep70 = getelementptr [1200 x double], [1200 x double]* %B, i64 %0, i64 0
  %scevgep68 = getelementptr [1200 x double], [1200 x double]* %B, i64 %indvars.iv58, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep70
  %bound1 = icmp ult double* %scevgep68, %scevgep66
  %found.conflict = and i1 %bound0, %bound1
  %bound073 = icmp ult double* %scevgep, %arrayidx41.us.us
  %bound174 = icmp ult double* %arrayidx41.us.us, %scevgep66
  %found.conflict75 = and i1 %bound073, %bound174
  %conflict.rdx = or i1 %found.conflict, %found.conflict75
  br i1 %conflict.rdx, label %for.cond4.preheader.us36.preheader, label %vector.ph

for.cond4.preheader.us36.preheader:               ; preds = %vector.memcheck
  br label %for.cond4.preheader.us36

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv58, i64 %index
  %2 = bitcast double* %1 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %2, align 8, !alias.scope !8, !noalias !11
  %3 = getelementptr double, double* %1, i64 2
  %4 = bitcast double* %3 to <2 x double>*
  %wide.load77 = load <2 x double>, <2 x double>* %4, align 8, !alias.scope !8, !noalias !11
  %5 = fmul <2 x double> %wide.load, %broadcast.splat79
  %6 = fmul <2 x double> %wide.load77, %broadcast.splat79
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv58, i64 %index
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load80 = load <2 x double>, <2 x double>* %8, align 8, !alias.scope !14
  %9 = getelementptr double, double* %7, i64 2
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load81 = load <2 x double>, <2 x double>* %10, align 8, !alias.scope !14
  %11 = fmul <2 x double> %wide.load80, %broadcast.splat83
  %12 = fmul <2 x double> %wide.load81, %broadcast.splat83
  %13 = load double, double* %arrayidx41.us.us, align 8, !alias.scope !15
  %14 = insertelement <2 x double> undef, double %13, i32 0
  %15 = shufflevector <2 x double> %14, <2 x double> undef, <2 x i32> zeroinitializer
  %16 = insertelement <2 x double> undef, double %13, i32 0
  %17 = shufflevector <2 x double> %16, <2 x double> undef, <2 x i32> zeroinitializer
  %18 = fmul <2 x double> %11, %15
  %19 = fmul <2 x double> %12, %17
  %20 = fadd <2 x double> %5, %18
  %21 = fadd <2 x double> %6, %19
  %22 = fadd <2 x double> %broadcast.splat85, %20
  %23 = fadd <2 x double> %broadcast.splat85, %21
  %24 = bitcast double* %1 to <2 x double>*
  store <2 x double> %22, <2 x double>* %24, align 8, !alias.scope !8, !noalias !11
  %25 = bitcast double* %3 to <2 x double>*
  store <2 x double> %23, <2 x double>* %25, align 8, !alias.scope !8, !noalias !11
  %index.next = add i64 %index, 4
  %26 = icmp eq i64 %index.next, 1200
  br i1 %26, label %for.cond1.for.inc53_crit_edge.us.loopexit89, label %vector.body.vector.body_crit_edge, !llvm.loop !16

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

for.cond4.preheader.us36:                         ; preds = %for.cond4.preheader.us36.for.cond4.preheader.us36_crit_edge, %for.cond4.preheader.us36.preheader
  %indvars.iv = phi i64 [ 0, %for.cond4.preheader.us36.preheader ], [ %indvars.iv.next.1, %for.cond4.preheader.us36.for.cond4.preheader.us36_crit_edge ]
  %arrayidx31.us11 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv58, i64 %indvars.iv
  %27 = load double, double* %arrayidx31.us11, align 8
  %mul32.us12 = fmul double %27, %beta
  %arrayidx36.us13 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv58, i64 %indvars.iv
  %28 = load double, double* %arrayidx36.us13, align 8
  %mul37.us14 = fmul double %28, %alpha
  %29 = load double, double* %arrayidx41.us.us, align 8
  %mul42.us16 = fmul double %mul37.us14, %29
  %add43.us17 = fadd double %mul32.us12, %mul42.us16
  %add45.us19 = fadd double %mul44.us18, %add43.us17
  store double %add45.us19, double* %arrayidx31.us11, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx31.us11.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv58, i64 %indvars.iv.next
  %30 = load double, double* %arrayidx31.us11.1, align 8
  %mul32.us12.1 = fmul double %30, %beta
  %arrayidx36.us13.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv58, i64 %indvars.iv.next
  %31 = load double, double* %arrayidx36.us13.1, align 8
  %mul37.us14.1 = fmul double %31, %alpha
  %32 = load double, double* %arrayidx41.us.us, align 8
  %mul42.us16.1 = fmul double %mul37.us14.1, %32
  %add43.us17.1 = fadd double %mul32.us12.1, %mul42.us16.1
  %add45.us19.1 = fadd double %mul44.us18, %add43.us17.1
  store double %add45.us19.1, double* %arrayidx31.us11.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %for.cond1.for.inc53_crit_edge.us.loopexit88, label %for.cond4.preheader.us36.for.cond4.preheader.us36_crit_edge, !llvm.loop !17

for.cond4.preheader.us36.for.cond4.preheader.us36_crit_edge: ; preds = %for.cond4.preheader.us36
  br label %for.cond4.preheader.us36

for.cond1.for.inc53_crit_edge.us.loopexit:        ; preds = %for.cond4.for.end_crit_edge.us.us
  br label %for.cond1.for.inc53_crit_edge.us

for.cond1.for.inc53_crit_edge.us.loopexit88:      ; preds = %for.cond4.preheader.us36
  br label %for.cond1.for.inc53_crit_edge.us

for.cond1.for.inc53_crit_edge.us.loopexit89:      ; preds = %vector.body
  br label %for.cond1.for.inc53_crit_edge.us

for.cond1.for.inc53_crit_edge.us:                 ; preds = %for.cond1.for.inc53_crit_edge.us.loopexit89, %for.cond1.for.inc53_crit_edge.us.loopexit88, %for.cond1.for.inc53_crit_edge.us.loopexit
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond61 = icmp eq i64 %indvars.iv.next59, 1000
  br i1 %exitcond61, label %for.end55, label %for.cond1.for.inc53_crit_edge.us.for.cond1.preheader.us_crit_edge

for.cond1.for.inc53_crit_edge.us.for.cond1.preheader.us_crit_edge: ; preds = %for.cond1.for.inc53_crit_edge.us
  br label %for.cond1.preheader.us

for.cond4.preheader.us.us:                        ; preds = %for.cond4.for.end_crit_edge.us.us.for.cond4.preheader.us.us_crit_edge, %for.cond4.preheader.us.us.preheader
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %for.cond4.for.end_crit_edge.us.us.for.cond4.preheader.us.us_crit_edge ], [ 0, %for.cond4.preheader.us.us.preheader ]
  %arrayidx8.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv58, i64 %indvars.iv54
  br label %for.body6.us.us

for.cond4.for.end_crit_edge.us.us:                ; preds = %for.body6.us.us
  %arrayidx31.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv58, i64 %indvars.iv54
  %33 = load double, double* %arrayidx31.us.us, align 8
  %mul32.us.us = fmul double %33, %beta
  %34 = load double, double* %arrayidx8.us.us, align 8
  %mul37.us.us = fmul double %34, %alpha
  %35 = load double, double* %arrayidx41.us.us, align 8
  %mul42.us.us = fmul double %mul37.us.us, %35
  %add43.us.us = fadd double %mul32.us.us, %mul42.us.us
  %mul44.us.us = fmul double %add27.us.us, %alpha
  %add45.us.us = fadd double %mul44.us.us, %add43.us.us
  store double %add45.us.us, double* %arrayidx31.us.us, align 8
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond57 = icmp eq i64 %indvars.iv.next55, 1200
  br i1 %exitcond57, label %for.cond1.for.inc53_crit_edge.us.loopexit, label %for.cond4.for.end_crit_edge.us.us.for.cond4.preheader.us.us_crit_edge

for.cond4.for.end_crit_edge.us.us.for.cond4.preheader.us.us_crit_edge: ; preds = %for.cond4.for.end_crit_edge.us.us
  br label %for.cond4.preheader.us.us

for.body6.us.us:                                  ; preds = %for.body6.us.us.for.body6.us.us_crit_edge, %for.cond4.preheader.us.us
  %indvars.iv48 = phi i64 [ 0, %for.cond4.preheader.us.us ], [ %indvars.iv.next49, %for.body6.us.us.for.body6.us.us_crit_edge ]
  %temp2.02.us.us = phi double [ 0.000000e+00, %for.cond4.preheader.us.us ], [ %add27.us.us, %for.body6.us.us.for.body6.us.us_crit_edge ]
  %36 = load double, double* %arrayidx8.us.us, align 8
  %mul.us.us = fmul double %36, %alpha
  %arrayidx12.us.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv48
  %37 = load double, double* %arrayidx12.us.us, align 8
  %mul13.us.us = fmul double %mul.us.us, %37
  %arrayidx17.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv48, i64 %indvars.iv54
  %38 = load double, double* %arrayidx17.us.us, align 8
  %add.us.us = fadd double %38, %mul13.us.us
  store double %add.us.us, double* %arrayidx17.us.us, align 8
  %arrayidx21.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv48, i64 %indvars.iv54
  %39 = load double, double* %arrayidx21.us.us, align 8
  %40 = load double, double* %arrayidx12.us.us, align 8
  %mul26.us.us = fmul double %39, %40
  %add27.us.us = fadd double %temp2.02.us.us, %mul26.us.us
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next49, %indvars.iv58
  br i1 %exitcond53, label %for.cond4.for.end_crit_edge.us.us, label %for.body6.us.us.for.body6.us.us_crit_edge

for.body6.us.us.for.body6.us.us_crit_edge:        ; preds = %for.body6.us.us
  br label %for.body6.us.us

for.end55:                                        ; preds = %for.cond1.for.inc53_crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32 %m, i32 %n, [1200 x double]* nocapture readonly %C) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us.for.cond2.preheader.us_crit_edge, %entry
  %indvars.iv5 = phi i64 [ 0, %entry ], [ %indvars.iv.next6, %for.cond2.for.inc10_crit_edge.us.for.cond2.preheader.us_crit_edge ]
  %3 = mul nsw i64 %indvars.iv5, 1000
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us.for.body4.us_crit_edge, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %if.end.us.for.body4.us_crit_edge ]
  %4 = add nsw i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.body4.us.if.end.us_crit_edge

for.body4.us.if.end.us_crit_edge:                 ; preds = %for.body4.us
  br label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us.if.end.us_crit_edge, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv5, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %if.end.us.for.body4.us_crit_edge

if.end.us.for.body4.us_crit_edge:                 ; preds = %if.end.us
  br label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next6, 1000
  br i1 %exitcond9, label %for.end12, label %for.cond2.for.inc10_crit_edge.us.for.cond2.preheader.us_crit_edge

for.cond2.for.inc10_crit_edge.us.for.cond2.preheader.us_crit_edge: ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
!8 = !{!9}
!9 = distinct !{!9, !10}
!10 = distinct !{!10, !"LVerDomain"}
!11 = !{!12, !13}
!12 = distinct !{!12, !10}
!13 = distinct !{!13, !10}
!14 = !{!12}
!15 = !{!13}
!16 = distinct !{!16, !4, !5}
!17 = distinct !{!17, !4, !5}
