; ModuleID = 'A.ll'
source_filename = "ludcmp.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %arraydecay = bitcast i8* %call to [2000 x double]*
  %arraydecay4 = bitcast i8* %call1 to double*
  %arraydecay5 = bitcast i8* %call2 to double*
  %arraydecay6 = bitcast i8* %call3 to double*
  tail call fastcc void @init_array([2000 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay5, double* %arraydecay6)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay7 = bitcast i8* %call to [2000 x double]*
  %arraydecay8 = bitcast i8* %call1 to double*
  %arraydecay9 = bitcast i8* %call2 to double*
  %arraydecay10 = bitcast i8* %call3 to double*
  tail call fastcc void @kernel_ludcmp([2000 x double]* %arraydecay7, double* %arraydecay8, double* %arraydecay9, double* %arraydecay10)
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
  %arraydecay12 = bitcast i8* %call2 to double*
  tail call fastcc void @print_array(double* %arraydecay12)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  tail call void @free(i8* %call3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture %A, double* nocapture %b, double* nocapture %x, double* nocapture %y) unnamed_addr #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv110 = phi i64 [ 0, %entry ], [ %indvars.iv.next111.1, %for.body ]
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv110
  %0 = bitcast double* %arrayidx to <2 x double>*
  %arrayidx3 = getelementptr inbounds double, double* %y, i64 %indvars.iv110
  %1 = bitcast double* %arrayidx3 to <2 x double>*
  %2 = trunc i64 %indvars.iv110 to i32
  %3 = or i32 %2, 1
  %conv4 = sitofp i32 %3 to double
  %arrayidx8 = getelementptr inbounds double, double* %b, i64 %indvars.iv110
  store <2 x double> zeroinitializer, <2 x double>* %0, align 8
  store <2 x double> zeroinitializer, <2 x double>* %1, align 8
  %indvars.iv.next111.1 = add nuw nsw i64 %indvars.iv110, 2
  %4 = trunc i64 %indvars.iv.next111.1 to i32
  %conv4.1 = sitofp i32 %4 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv4, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv4.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 2.000000e+03, double 2.000000e+03>
  %div5 = fmul <2 x double> %div, <double 5.000000e-01, double 5.000000e-01>
  %add6 = fadd <2 x double> %div5, <double 4.000000e+00, double 4.000000e+00>
  %5 = bitcast double* %arrayidx8 to <2 x double>*
  store <2 x double> %add6, <2 x double>* %5, align 8
  %exitcond112.1 = icmp eq i64 %indvars.iv.next111.1, 2000
  br i1 %exitcond112.1, label %for.body16.lr.ph.preheader, label %for.body

for.body16.lr.ph.preheader:                       ; preds = %for.body
  br label %for.body16.lr.ph

for.body16.lr.ph:                                 ; preds = %for.body16.lr.ph.preheader, %for.body16.lr.ph.backedge
  %indvars.iv107 = phi i64 [ %indvars.iv.next108, %for.body16.lr.ph.backedge ], [ 0, %for.body16.lr.ph.preheader ]
  %indvars.iv105 = phi i64 [ %indvars.iv105.be, %for.body16.lr.ph.backedge ], [ 1, %for.body16.lr.ph.preheader ]
  %6 = mul nuw nsw i64 %indvars.iv107, 2001
  %7 = add nuw nsw i64 %6, 1
  %8 = sub i64 1998, %indvars.iv107
  %9 = shl i64 %8, 3
  br label %for.body16

for.cond29.preheader:                             ; preds = %for.body16
  %indvars.iv.next108 = add nuw nsw i64 %indvars.iv107, 1
  %cmp3073 = icmp slt i64 %indvars.iv.next108, 2000
  br i1 %cmp3073, label %for.end39.thread, label %for.end39

for.body16:                                       ; preds = %for.body16, %for.body16.lr.ph
  %indvars.iv87 = phi i64 [ %indvars.iv.next88, %for.body16 ], [ 0, %for.body16.lr.ph ]
  %10 = sub nsw i64 0, %indvars.iv87
  %11 = trunc i64 %10 to i32
  %rem = srem i32 %11, 2000
  %conv17 = sitofp i32 %rem to double
  %div19 = fdiv double %conv17, 2.000000e+03
  %add20 = fadd double %div19, 1.000000e+00
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv107, i64 %indvars.iv87
  store double %add20, double* %arrayidx24, align 8
  %indvars.iv.next88 = add nuw nsw i64 %indvars.iv87, 1
  %exitcond96 = icmp eq i64 %indvars.iv.next88, %indvars.iv105
  br i1 %exitcond96, label %for.cond29.preheader, label %for.body16

for.end39.thread:                                 ; preds = %for.cond29.preheader
  %12 = and i64 %9, 34359738360
  %scevgep = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %7
  %13 = add nuw nsw i64 %12, 8
  %scevgep104 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep104, i8 0, i64 %13, i32 8, i1 false)
  %arrayidx43115 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv107, i64 %indvars.iv107
  store double 1.000000e+00, double* %arrayidx43115, align 8
  br label %for.body16.lr.ph.backedge

for.end39:                                        ; preds = %for.cond29.preheader
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv107, i64 %indvars.iv107
  store double 1.000000e+00, double* %arrayidx43, align 8
  %exitcond109 = icmp eq i64 %indvars.iv.next108, 2000
  br i1 %exitcond109, label %for.inc62.for.cond69.preheader_crit_edge, label %for.body16.lr.ph.backedge

for.body16.lr.ph.backedge:                        ; preds = %for.end39, %for.end39.thread
  %indvars.iv105.be = add nuw nsw i64 %indvars.iv105, 1
  br label %for.body16.lr.ph

for.inc62.for.cond69.preheader_crit_edge:         ; preds = %for.end39
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  call void @llvm.memset.p0i8.i64(i8* %call, i8 0, i64 32000000, i32 8, i1 false)
  %14 = bitcast i8* %call to [2000 x [2000 x double]]*
  %15 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond69.preheader

for.cond69.preheader:                             ; preds = %for.inc96, %for.inc62.for.cond69.preheader_crit_edge
  %indvars.iv123 = phi i64 [ %indvars.iv.next124, %for.inc96 ], [ 0, %for.inc62.for.cond69.preheader_crit_edge ]
  br label %for.cond73.preheader

for.cond73.preheader:                             ; preds = %for.inc93, %for.cond69.preheader
  %indvars.iv120 = phi i64 [ %indvars.iv.next121, %for.inc93 ], [ 0, %for.cond69.preheader ]
  %arrayidx80 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv120, i64 %indvars.iv123
  br label %for.body76

for.body76:                                       ; preds = %for.body76, %for.cond73.preheader
  %indvars.iv78 = phi i64 [ 0, %for.cond73.preheader ], [ %indvars.iv.next79.1, %for.body76 ]
  %16 = load double, double* %arrayidx80, align 8
  %arrayidx84 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv78, i64 %indvars.iv123
  %17 = load double, double* %arrayidx84, align 8
  %mul = fmul double %16, %17
  %arrayidx88 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %15, i64 0, i64 %indvars.iv120, i64 %indvars.iv78
  %18 = load double, double* %arrayidx88, align 8
  %add89 = fadd double %18, %mul
  store double %add89, double* %arrayidx88, align 8
  %indvars.iv.next79 = or i64 %indvars.iv78, 1
  %19 = load double, double* %arrayidx80, align 8
  %arrayidx84.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next79, i64 %indvars.iv123
  %20 = load double, double* %arrayidx84.1, align 8
  %mul.1 = fmul double %19, %20
  %arrayidx88.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %14, i64 0, i64 %indvars.iv120, i64 %indvars.iv.next79
  %21 = load double, double* %arrayidx88.1, align 8
  %add89.1 = fadd double %21, %mul.1
  store double %add89.1, double* %arrayidx88.1, align 8
  %indvars.iv.next79.1 = add nuw nsw i64 %indvars.iv78, 2
  %exitcond80.1 = icmp eq i64 %indvars.iv.next79.1, 2000
  br i1 %exitcond80.1, label %for.inc93, label %for.body76

for.inc93:                                        ; preds = %for.body76
  %indvars.iv.next121 = add nuw nsw i64 %indvars.iv120, 1
  %exitcond122 = icmp eq i64 %indvars.iv.next121, 2000
  br i1 %exitcond122, label %for.inc96, label %for.cond73.preheader

for.inc96:                                        ; preds = %for.inc93
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  %exitcond125 = icmp eq i64 %indvars.iv.next124, 2000
  br i1 %exitcond125, label %for.cond103.preheader.preheader, label %for.cond69.preheader

for.cond103.preheader.preheader:                  ; preds = %for.inc96
  %22 = bitcast i8* %call to [2000 x [2000 x double]]*
  %23 = bitcast i8* %call to [2000 x [2000 x double]]*
  %24 = bitcast i8* %call to [2000 x [2000 x double]]*
  %25 = bitcast i8* %call to [2000 x [2000 x double]]*
  %26 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond103.preheader

for.cond103.preheader:                            ; preds = %for.cond103.preheader.preheader, %for.inc118
  %indvars.iv118 = phi i64 [ 0, %for.cond103.preheader.preheader ], [ %indvars.iv.next119, %for.inc118 ]
  br label %for.body106

for.body106:                                      ; preds = %for.body106, %for.cond103.preheader
  %indvars.iv = phi i64 [ 0, %for.cond103.preheader ], [ %indvars.iv.next.4, %for.body106 ]
  %arrayidx110 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv118, i64 %indvars.iv
  %27 = bitcast double* %arrayidx110 to i64*
  %28 = load i64, i64* %27, align 8
  %arrayidx114 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv118, i64 %indvars.iv
  %29 = bitcast double* %arrayidx114 to i64*
  store i64 %28, i64* %29, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx110.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv118, i64 %indvars.iv.next
  %30 = bitcast double* %arrayidx110.1 to i64*
  %31 = load i64, i64* %30, align 8
  %arrayidx114.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv118, i64 %indvars.iv.next
  %32 = bitcast double* %arrayidx114.1 to i64*
  store i64 %31, i64* %32, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %arrayidx110.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %24, i64 0, i64 %indvars.iv118, i64 %indvars.iv.next.1
  %33 = bitcast double* %arrayidx110.2 to i64*
  %34 = load i64, i64* %33, align 8
  %arrayidx114.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv118, i64 %indvars.iv.next.1
  %35 = bitcast double* %arrayidx114.2 to i64*
  store i64 %34, i64* %35, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %arrayidx110.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %23, i64 0, i64 %indvars.iv118, i64 %indvars.iv.next.2
  %36 = bitcast double* %arrayidx110.3 to i64*
  %37 = load i64, i64* %36, align 8
  %arrayidx114.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv118, i64 %indvars.iv.next.2
  %38 = bitcast double* %arrayidx114.3 to i64*
  store i64 %37, i64* %38, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %arrayidx110.4 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvars.iv118, i64 %indvars.iv.next.3
  %39 = bitcast double* %arrayidx110.4 to i64*
  %40 = load i64, i64* %39, align 8
  %arrayidx114.4 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv118, i64 %indvars.iv.next.3
  %41 = bitcast double* %arrayidx114.4 to i64*
  store i64 %40, i64* %41, align 8
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %for.inc118, label %for.body106

for.inc118:                                       ; preds = %for.body106
  %indvars.iv.next119 = add nuw nsw i64 %indvars.iv118, 1
  %exitcond = icmp eq i64 %indvars.iv.next119, 2000
  br i1 %exitcond, label %for.end120, label %for.cond103.preheader

for.end120:                                       ; preds = %for.inc118
  tail call void @free(i8* nonnull %call) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture %A, double* nocapture readonly %b, double* nocapture %x, double* nocapture %y) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc58, %entry
  %indvars.iv183 = phi i64 [ %indvars.iv.next184, %for.inc58 ], [ 0, %entry ]
  %indvars.iv181 = phi i2 [ %indvars.iv.next182, %for.inc58 ], [ 0, %entry ]
  %indvars.iv179 = phi i64 [ %indvars.iv.next180, %for.inc58 ], [ 1, %entry ]
  %0 = zext i2 %indvars.iv181 to i64
  %1 = add nuw nsw i64 %0, 4294967295
  %2 = and i64 %1, 4294967295
  %3 = add i64 %indvars.iv179, %2
  %4 = add nuw nsw i64 %indvars.iv183, 4294967295
  %5 = sub nuw nsw i64 2000, %indvars.iv183
  %6 = trunc i64 %5 to i32
  %7 = sub nuw nsw i64 1999, %indvars.iv183
  %8 = trunc i64 %7 to i32
  %cmp293 = icmp sgt i64 %indvars.iv183, 0
  br i1 %cmp293, label %for.body3.preheader, label %for.body30.lr.ph.for.body30_crit_edge

for.body3.preheader:                              ; preds = %for.cond1.preheader
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv183, i64 0
  br label %for.body3

for.body30.lr.ph:                                 ; preds = %for.end
  %cmp3695 = icmp sgt i64 %indvars.iv183, 0
  br i1 %cmp3695, label %for.body30.lr.ph.for.body30.us_crit_edge, label %for.body30.lr.ph.for.body30_crit_edge

for.body30.lr.ph.for.body30_crit_edge:            ; preds = %for.cond1.preheader, %for.body30.lr.ph
  %xtraiter147 = and i32 %6, 3
  %lcmp.mod148 = icmp eq i32 %xtraiter147, 0
  br i1 %lcmp.mod148, label %for.body30.prol.loopexit, label %for.body30.prol.preheader

for.body30.prol.preheader:                        ; preds = %for.body30.lr.ph.for.body30_crit_edge
  br label %for.body30.prol

for.body30.prol:                                  ; preds = %for.body30.prol.preheader, %for.body30.prol
  %indvars.iv143.prol = phi i64 [ %indvars.iv.next144.prol, %for.body30.prol ], [ %indvars.iv183, %for.body30.prol.preheader ]
  %prol.iter149 = phi i32 [ %prol.iter149.sub, %for.body30.prol ], [ %xtraiter147, %for.body30.prol.preheader ]
  %arrayidx34.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv183, i64 %indvars.iv143.prol
  %9 = bitcast double* %arrayidx34.prol to i64*
  %10 = load i64, i64* %9, align 8
  %arrayidx54.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv183, i64 %indvars.iv143.prol
  %11 = bitcast double* %arrayidx54.prol to i64*
  store i64 %10, i64* %11, align 8
  %indvars.iv.next144.prol = add nuw nsw i64 %indvars.iv143.prol, 1
  %prol.iter149.sub = add nsw i32 %prol.iter149, -1
  %prol.iter149.cmp = icmp eq i32 %prol.iter149.sub, 0
  br i1 %prol.iter149.cmp, label %for.body30.prol.loopexit.loopexit, label %for.body30.prol, !llvm.loop !1

for.body30.prol.loopexit.loopexit:                ; preds = %for.body30.prol
  br label %for.body30.prol.loopexit

for.body30.prol.loopexit:                         ; preds = %for.body30.prol.loopexit.loopexit, %for.body30.lr.ph.for.body30_crit_edge
  %indvars.iv143.unr = phi i64 [ %indvars.iv183, %for.body30.lr.ph.for.body30_crit_edge ], [ %3, %for.body30.prol.loopexit.loopexit ]
  %12 = icmp ult i32 %8, 3
  br i1 %12, label %for.inc58, label %for.body30.preheader

for.body30.preheader:                             ; preds = %for.body30.prol.loopexit
  %13 = sub i64 1996, %indvars.iv143.unr
  %14 = lshr i64 %13, 2
  %15 = and i64 %14, 1
  %lcmp.mod5 = icmp eq i64 %15, 0
  br i1 %lcmp.mod5, label %for.body30.prol6, label %for.body30.prol.loopexit3

for.body30.prol6:                                 ; preds = %for.body30.preheader
  %arrayidx34.prol8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv183, i64 %indvars.iv143.unr
  %16 = bitcast double* %arrayidx34.prol8 to <2 x i64>*
  %arrayidx54.prol9 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv183, i64 %indvars.iv143.unr
  %17 = load <2 x i64>, <2 x i64>* %16, align 8
  %18 = bitcast double* %arrayidx54.prol9 to <2 x i64>*
  store <2 x i64> %17, <2 x i64>* %18, align 8
  %indvars.iv.next144.1.prol = add nsw i64 %indvars.iv143.unr, 2
  %arrayidx34.2.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv183, i64 %indvars.iv.next144.1.prol
  %19 = bitcast double* %arrayidx34.2.prol to <2 x i64>*
  %arrayidx54.2.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv183, i64 %indvars.iv.next144.1.prol
  %20 = load <2 x i64>, <2 x i64>* %19, align 8
  %21 = bitcast double* %arrayidx54.2.prol to <2 x i64>*
  store <2 x i64> %20, <2 x i64>* %21, align 8
  %indvars.iv.next144.3.prol = add nsw i64 %indvars.iv143.unr, 4
  br label %for.body30.prol.loopexit3

for.body30.prol.loopexit3:                        ; preds = %for.body30.prol6, %for.body30.preheader
  %indvars.iv143.unr10.ph = phi i64 [ %indvars.iv.next144.3.prol, %for.body30.prol6 ], [ %indvars.iv143.unr, %for.body30.preheader ]
  %22 = icmp eq i64 %14, 0
  br i1 %22, label %for.inc58, label %for.body30.preheader.new

for.body30.preheader.new:                         ; preds = %for.body30.prol.loopexit3
  br label %for.body30

for.body30.lr.ph.for.body30.us_crit_edge:         ; preds = %for.body30.lr.ph
  %xtraiter159166 = and i64 %indvars.iv183, 1
  %23 = trunc i64 %4 to i32
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv183, i64 0
  %24 = icmp eq i64 %xtraiter159166, 0
  %25 = icmp eq i32 %23, 0
  br label %for.body30.us

for.body30.us:                                    ; preds = %for.end50.us, %for.body30.lr.ph.for.body30.us_crit_edge
  %indvars.iv185 = phi i64 [ %indvars.iv.next186, %for.end50.us ], [ %indvars.iv183, %for.body30.lr.ph.for.body30.us_crit_edge ]
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv183, i64 %indvars.iv185
  %26 = load double, double* %arrayidx34.us, align 8
  br i1 %24, label %for.inc48.us.prol.loopexit, label %for.inc48.us.prol

for.inc48.us.prol:                                ; preds = %for.body30.us
  %27 = load double, double* %arrayidx41.us.prol, align 8
  %arrayidx45.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv185
  %28 = load double, double* %arrayidx45.us.prol, align 8
  %mul46.us.prol = fmul double %27, %28
  %sub47.us.prol = fsub double %26, %mul46.us.prol
  br label %for.inc48.us.prol.loopexit

for.inc48.us.prol.loopexit:                       ; preds = %for.inc48.us.prol, %for.body30.us
  %indvars.iv150.unr.ph = phi i64 [ 1, %for.inc48.us.prol ], [ 0, %for.body30.us ]
  %w.197.us.unr.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ %26, %for.body30.us ]
  %sub47.us.lcssa.unr.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ undef, %for.body30.us ]
  br i1 %25, label %for.end50.us, label %for.inc48.us.preheader

for.inc48.us.preheader:                           ; preds = %for.inc48.us.prol.loopexit
  br label %for.inc48.us

for.inc48.us:                                     ; preds = %for.inc48.us.preheader, %for.inc48.us
  %indvars.iv150 = phi i64 [ %indvars.iv.next151.1, %for.inc48.us ], [ %indvars.iv150.unr.ph, %for.inc48.us.preheader ]
  %w.197.us = phi double [ %sub47.us.1, %for.inc48.us ], [ %w.197.us.unr.ph, %for.inc48.us.preheader ]
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv183, i64 %indvars.iv150
  %29 = bitcast double* %arrayidx41.us to <2 x double>*
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv150, i64 %indvars.iv185
  %30 = load double, double* %arrayidx45.us, align 8
  %indvars.iv.next151 = add nuw nsw i64 %indvars.iv150, 1
  %31 = load <2 x double>, <2 x double>* %29, align 8
  %arrayidx45.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next151, i64 %indvars.iv185
  %32 = load double, double* %arrayidx45.us.1, align 8
  %mul46.us.v.i1.1 = insertelement <2 x double> undef, double %30, i32 0
  %mul46.us.v.i1.2 = insertelement <2 x double> %mul46.us.v.i1.1, double %32, i32 1
  %mul46.us = fmul <2 x double> %31, %mul46.us.v.i1.2
  %mul46.us.v.r1 = extractelement <2 x double> %mul46.us, i32 0
  %mul46.us.v.r2 = extractelement <2 x double> %mul46.us, i32 1
  %sub47.us = fsub double %w.197.us, %mul46.us.v.r1
  %sub47.us.1 = fsub double %sub47.us, %mul46.us.v.r2
  %indvars.iv.next151.1 = add nuw nsw i64 %indvars.iv150, 2
  %exitcond158.1 = icmp eq i64 %indvars.iv.next151.1, %indvars.iv183
  br i1 %exitcond158.1, label %for.end50.us.loopexit, label %for.inc48.us

for.end50.us.loopexit:                            ; preds = %for.inc48.us
  br label %for.end50.us

for.end50.us:                                     ; preds = %for.end50.us.loopexit, %for.inc48.us.prol.loopexit
  %sub47.us.lcssa = phi double [ %sub47.us.lcssa.unr.ph, %for.inc48.us.prol.loopexit ], [ %sub47.us.1, %for.end50.us.loopexit ]
  %arrayidx54.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv183, i64 %indvars.iv185
  store double %sub47.us.lcssa, double* %arrayidx54.us, align 8
  %indvars.iv.next186 = add nuw nsw i64 %indvars.iv185, 1
  %exitcond187 = icmp eq i64 %indvars.iv.next186, 2000
  br i1 %exitcond187, label %for.inc58.loopexit, label %for.body30.us

for.body3:                                        ; preds = %for.body3.preheader, %for.end
  %indvars.iv132 = phi i64 [ %indvars.iv.next133, %for.end ], [ 0, %for.body3.preheader ]
  %33 = add nuw nsw i64 %indvars.iv132, 4294967295
  %arrayidx5 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv183, i64 %indvars.iv132
  %34 = load double, double* %arrayidx5, align 8
  %cmp789 = icmp sgt i64 %indvars.iv132, 0
  br i1 %cmp789, label %for.inc.lr.ph, label %for.end

for.inc.lr.ph:                                    ; preds = %for.body3
  %xtraiter128167 = and i64 %indvars.iv132, 1
  %lcmp.mod129 = icmp eq i64 %xtraiter128167, 0
  br i1 %lcmp.mod129, label %for.inc.prol.loopexit, label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.lr.ph
  %35 = load double, double* %arrayidx12.prol, align 8
  %arrayidx16.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv132
  %36 = load double, double* %arrayidx16.prol, align 8
  %mul.prol = fmul double %35, %36
  %sub.prol = fsub double %34, %mul.prol
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol, %for.inc.lr.ph
  %indvars.iv119.unr.ph = phi i64 [ 1, %for.inc.prol ], [ 0, %for.inc.lr.ph ]
  %w.091.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ %34, %for.inc.lr.ph ]
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ undef, %for.inc.lr.ph ]
  %37 = trunc i64 %33 to i32
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %for.end, label %for.inc.preheader

for.inc.preheader:                                ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc.preheader, %for.inc
  %indvars.iv119 = phi i64 [ %indvars.iv.next120.1, %for.inc ], [ %indvars.iv119.unr.ph, %for.inc.preheader ]
  %w.091 = phi double [ %sub.1, %for.inc ], [ %w.091.unr.ph, %for.inc.preheader ]
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv183, i64 %indvars.iv119
  %39 = bitcast double* %arrayidx12 to <2 x double>*
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv119, i64 %indvars.iv132
  %40 = load double, double* %arrayidx16, align 8
  %indvars.iv.next120 = add nuw nsw i64 %indvars.iv119, 1
  %41 = load <2 x double>, <2 x double>* %39, align 8
  %arrayidx16.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next120, i64 %indvars.iv132
  %42 = load double, double* %arrayidx16.1, align 8
  %mul.v.i1.1 = insertelement <2 x double> undef, double %40, i32 0
  %mul.v.i1.2 = insertelement <2 x double> %mul.v.i1.1, double %42, i32 1
  %mul = fmul <2 x double> %41, %mul.v.i1.2
  %mul.v.r1 = extractelement <2 x double> %mul, i32 0
  %mul.v.r2 = extractelement <2 x double> %mul, i32 1
  %sub = fsub double %w.091, %mul.v.r1
  %sub.1 = fsub double %sub, %mul.v.r2
  %indvars.iv.next120.1 = add nuw nsw i64 %indvars.iv119, 2
  %exitcond127.1 = icmp eq i64 %indvars.iv.next120.1, %indvars.iv132
  br i1 %exitcond127.1, label %for.end.loopexit, label %for.inc

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.inc.prol.loopexit, %for.body3
  %w.0.lcssa = phi double [ %34, %for.body3 ], [ %sub.lcssa.unr.ph, %for.inc.prol.loopexit ], [ %sub.1, %for.end.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv132, i64 %indvars.iv132
  %43 = load double, double* %arrayidx20, align 8
  %div = fdiv double %w.0.lcssa, %43
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv183, i64 %indvars.iv132
  store double %div, double* %arrayidx24, align 8
  %indvars.iv.next133 = add nuw nsw i64 %indvars.iv132, 1
  %exitcond140 = icmp eq i64 %indvars.iv.next133, %indvars.iv183
  br i1 %exitcond140, label %for.body30.lr.ph, label %for.body3

for.body30:                                       ; preds = %for.body30, %for.body30.preheader.new
  %indvars.iv143 = phi i64 [ %indvars.iv143.unr10.ph, %for.body30.preheader.new ], [ %indvars.iv.next144.3.1, %for.body30 ]
  %arrayidx34 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv183, i64 %indvars.iv143
  %44 = bitcast double* %arrayidx34 to <2 x i64>*
  %arrayidx54 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv183, i64 %indvars.iv143
  %45 = load <2 x i64>, <2 x i64>* %44, align 8
  %46 = bitcast double* %arrayidx54 to <2 x i64>*
  store <2 x i64> %45, <2 x i64>* %46, align 8
  %indvars.iv.next144.1 = add nsw i64 %indvars.iv143, 2
  %arrayidx34.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv183, i64 %indvars.iv.next144.1
  %47 = bitcast double* %arrayidx34.2 to <2 x i64>*
  %arrayidx54.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv183, i64 %indvars.iv.next144.1
  %48 = load <2 x i64>, <2 x i64>* %47, align 8
  %49 = bitcast double* %arrayidx54.2 to <2 x i64>*
  store <2 x i64> %48, <2 x i64>* %49, align 8
  %indvars.iv.next144.3 = add nsw i64 %indvars.iv143, 4
  %arrayidx34.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv183, i64 %indvars.iv.next144.3
  %50 = bitcast double* %arrayidx34.1 to <2 x i64>*
  %arrayidx54.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv183, i64 %indvars.iv.next144.3
  %51 = load <2 x i64>, <2 x i64>* %50, align 8
  %52 = bitcast double* %arrayidx54.1 to <2 x i64>*
  store <2 x i64> %51, <2 x i64>* %52, align 8
  %indvars.iv.next144.1.1 = add nsw i64 %indvars.iv143, 6
  %arrayidx34.2.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv183, i64 %indvars.iv.next144.1.1
  %53 = bitcast double* %arrayidx34.2.1 to <2 x i64>*
  %arrayidx54.2.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv183, i64 %indvars.iv.next144.1.1
  %54 = load <2 x i64>, <2 x i64>* %53, align 8
  %55 = bitcast double* %arrayidx54.2.1 to <2 x i64>*
  store <2 x i64> %54, <2 x i64>* %55, align 8
  %indvars.iv.next144.3.1 = add nsw i64 %indvars.iv143, 8
  %exitcond145.3.1 = icmp eq i64 %indvars.iv.next144.3.1, 2000
  br i1 %exitcond145.3.1, label %for.inc58.loopexit11, label %for.body30

for.inc58.loopexit:                               ; preds = %for.end50.us
  br label %for.inc58

for.inc58.loopexit11:                             ; preds = %for.body30
  br label %for.inc58

for.inc58:                                        ; preds = %for.inc58.loopexit11, %for.inc58.loopexit, %for.body30.prol.loopexit3, %for.body30.prol.loopexit
  %indvars.iv.next184 = add nuw nsw i64 %indvars.iv183, 1
  %exitcond165 = icmp eq i64 %indvars.iv.next184, 2000
  %indvars.iv.next180 = add nuw nsw i64 %indvars.iv179, 1
  %indvars.iv.next182 = add i2 %indvars.iv181, -1
  br i1 %exitcond165, label %for.body63.preheader, label %for.cond1.preheader

for.body63.preheader:                             ; preds = %for.inc58
  br label %for.body63

for.body63:                                       ; preds = %for.body63.preheader, %for.end79
  %indvars.iv177 = phi i2 [ %indvars.iv.next178, %for.end79 ], [ 0, %for.body63.preheader ]
  %indvars.iv117 = phi i64 [ %indvars.iv.next118, %for.end79 ], [ 0, %for.body63.preheader ]
  %56 = zext i2 %indvars.iv177 to i64
  %57 = add nuw nsw i64 %56, 4294967295
  %58 = and i64 %57, 4294967295
  %59 = add nuw nsw i64 %58, 1
  %60 = add nuw nsw i64 %indvars.iv117, 4294967295
  %arrayidx65 = getelementptr inbounds double, double* %b, i64 %indvars.iv117
  %61 = load double, double* %arrayidx65, align 8
  %cmp6783 = icmp sgt i64 %indvars.iv117, 0
  br i1 %cmp6783, label %for.body63.for.inc77_crit_edge, label %for.end79

for.body63.for.inc77_crit_edge:                   ; preds = %for.body63
  %62 = trunc i64 %indvars.iv117 to i32
  %xtraiter113 = and i32 %62, 3
  %lcmp.mod114 = icmp eq i32 %xtraiter113, 0
  br i1 %lcmp.mod114, label %for.inc77.prol.loopexit, label %for.inc77.prol.preheader

for.inc77.prol.preheader:                         ; preds = %for.body63.for.inc77_crit_edge
  br label %for.inc77.prol

for.inc77.prol:                                   ; preds = %for.inc77.prol.preheader, %for.inc77.prol
  %indvars.iv106.prol = phi i64 [ %indvars.iv.next107.prol, %for.inc77.prol ], [ 0, %for.inc77.prol.preheader ]
  %w.285.prol = phi double [ %sub76.prol, %for.inc77.prol ], [ %61, %for.inc77.prol.preheader ]
  %prol.iter115 = phi i32 [ %prol.iter115.sub, %for.inc77.prol ], [ %xtraiter113, %for.inc77.prol.preheader ]
  %arrayidx72.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv117, i64 %indvars.iv106.prol
  %63 = load double, double* %arrayidx72.prol, align 8
  %arrayidx74.prol = getelementptr inbounds double, double* %y, i64 %indvars.iv106.prol
  %64 = load double, double* %arrayidx74.prol, align 8
  %mul75.prol = fmul double %63, %64
  %sub76.prol = fsub double %w.285.prol, %mul75.prol
  %indvars.iv.next107.prol = add nuw nsw i64 %indvars.iv106.prol, 1
  %prol.iter115.sub = add nsw i32 %prol.iter115, -1
  %prol.iter115.cmp = icmp eq i32 %prol.iter115.sub, 0
  br i1 %prol.iter115.cmp, label %for.inc77.prol.loopexit.loopexit, label %for.inc77.prol, !llvm.loop !3

for.inc77.prol.loopexit.loopexit:                 ; preds = %for.inc77.prol
  br label %for.inc77.prol.loopexit

for.inc77.prol.loopexit:                          ; preds = %for.inc77.prol.loopexit.loopexit, %for.body63.for.inc77_crit_edge
  %indvars.iv106.unr = phi i64 [ 0, %for.body63.for.inc77_crit_edge ], [ %59, %for.inc77.prol.loopexit.loopexit ]
  %w.285.unr = phi double [ %61, %for.body63.for.inc77_crit_edge ], [ %sub76.prol, %for.inc77.prol.loopexit.loopexit ]
  %sub76.lcssa.unr = phi double [ undef, %for.body63.for.inc77_crit_edge ], [ %sub76.prol, %for.inc77.prol.loopexit.loopexit ]
  %65 = trunc i64 %60 to i32
  %66 = icmp ult i32 %65, 3
  br i1 %66, label %for.end79, label %for.inc77.preheader

for.inc77.preheader:                              ; preds = %for.inc77.prol.loopexit
  br label %for.inc77

for.inc77:                                        ; preds = %for.inc77.preheader, %for.inc77
  %indvars.iv106 = phi i64 [ %indvars.iv.next107.3, %for.inc77 ], [ %indvars.iv106.unr, %for.inc77.preheader ]
  %w.285 = phi double [ %sub76.3, %for.inc77 ], [ %w.285.unr, %for.inc77.preheader ]
  %arrayidx72 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv117, i64 %indvars.iv106
  %67 = bitcast double* %arrayidx72 to <2 x double>*
  %arrayidx74 = getelementptr inbounds double, double* %y, i64 %indvars.iv106
  %68 = bitcast double* %arrayidx74 to <2 x double>*
  %69 = load <2 x double>, <2 x double>* %67, align 8
  %70 = load <2 x double>, <2 x double>* %68, align 8
  %mul75 = fmul <2 x double> %69, %70
  %mul75.v.r1 = extractelement <2 x double> %mul75, i32 0
  %mul75.v.r2 = extractelement <2 x double> %mul75, i32 1
  %sub76 = fsub double %w.285, %mul75.v.r1
  %sub76.1 = fsub double %sub76, %mul75.v.r2
  %indvars.iv.next107.1 = add nsw i64 %indvars.iv106, 2
  %arrayidx72.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv117, i64 %indvars.iv.next107.1
  %71 = bitcast double* %arrayidx72.2 to <2 x double>*
  %arrayidx74.2 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next107.1
  %72 = bitcast double* %arrayidx74.2 to <2 x double>*
  %73 = load <2 x double>, <2 x double>* %71, align 8
  %74 = load <2 x double>, <2 x double>* %72, align 8
  %mul75.2 = fmul <2 x double> %73, %74
  %mul75.2.v.r1 = extractelement <2 x double> %mul75.2, i32 0
  %mul75.2.v.r2 = extractelement <2 x double> %mul75.2, i32 1
  %sub76.2 = fsub double %sub76.1, %mul75.2.v.r1
  %sub76.3 = fsub double %sub76.2, %mul75.2.v.r2
  %indvars.iv.next107.3 = add nsw i64 %indvars.iv106, 4
  %exitcond110.3 = icmp eq i64 %indvars.iv.next107.3, %indvars.iv117
  br i1 %exitcond110.3, label %for.end79.loopexit, label %for.inc77

for.end79.loopexit:                               ; preds = %for.inc77
  br label %for.end79

for.end79:                                        ; preds = %for.end79.loopexit, %for.inc77.prol.loopexit, %for.body63
  %w.2.lcssa = phi double [ %61, %for.body63 ], [ %sub76.lcssa.unr, %for.inc77.prol.loopexit ], [ %sub76.3, %for.end79.loopexit ]
  %arrayidx81 = getelementptr inbounds double, double* %y, i64 %indvars.iv117
  store double %w.2.lcssa, double* %arrayidx81, align 8
  %indvars.iv.next118 = add nuw nsw i64 %indvars.iv117, 1
  %exitcond116 = icmp eq i64 %indvars.iv.next118, 2000
  %indvars.iv.next178 = add i2 %indvars.iv177, 1
  br i1 %exitcond116, label %for.body88.preheader, label %for.body63

for.body88.preheader:                             ; preds = %for.end79
  br label %for.body88

for.body88:                                       ; preds = %for.body88.preheader, %for.end104
  %indvars.iv174 = phi i64 [ %indvars.iv.next175, %for.end104 ], [ 1999, %for.body88.preheader ]
  %indvars.iv172 = phi i2 [ %indvars.iv.next173, %for.end104 ], [ 0, %for.body88.preheader ]
  %indvars.iv170 = phi i64 [ %indvars.iv.next171, %for.end104 ], [ 2001, %for.body88.preheader ]
  %indvar = phi i32 [ %indvar.next, %for.end104 ], [ 0, %for.body88.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.end104 ], [ 2000, %for.body88.preheader ]
  %75 = zext i2 %indvars.iv172 to i64
  %76 = add nuw nsw i64 %75, 4294967295
  %77 = and i64 %76, 4294967295
  %78 = add i64 %indvars.iv170, %77
  %79 = add nsw i32 %indvar, -1
  %arrayidx90 = getelementptr inbounds double, double* %y, i64 %indvars.iv174
  %80 = load double, double* %arrayidx90, align 8
  %81 = add nuw nsw i64 %indvars.iv174, 1
  %cmp9278 = icmp slt i64 %81, 2000
  br i1 %cmp9278, label %for.body88.for.inc102_crit_edge, label %for.end104

for.body88.for.inc102_crit_edge:                  ; preds = %for.body88
  %xtraiter = and i32 %indvar, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc102.prol.loopexit, label %for.inc102.prol.preheader

for.inc102.prol.preheader:                        ; preds = %for.body88.for.inc102_crit_edge
  br label %for.inc102.prol

for.inc102.prol:                                  ; preds = %for.inc102.prol.preheader, %for.inc102.prol
  %indvars.iv104.prol = phi i64 [ %indvars.iv.next105.prol, %for.inc102.prol ], [ %indvars.iv, %for.inc102.prol.preheader ]
  %w.379.prol = phi double [ %sub101.prol, %for.inc102.prol ], [ %80, %for.inc102.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.inc102.prol ], [ %xtraiter, %for.inc102.prol.preheader ]
  %arrayidx97.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv174, i64 %indvars.iv104.prol
  %82 = load double, double* %arrayidx97.prol, align 8
  %arrayidx99.prol = getelementptr inbounds double, double* %x, i64 %indvars.iv104.prol
  %83 = load double, double* %arrayidx99.prol, align 8
  %mul100.prol = fmul double %82, %83
  %sub101.prol = fsub double %w.379.prol, %mul100.prol
  %indvars.iv.next105.prol = add nuw nsw i64 %indvars.iv104.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc102.prol.loopexit.loopexit, label %for.inc102.prol, !llvm.loop !4

for.inc102.prol.loopexit.loopexit:                ; preds = %for.inc102.prol
  br label %for.inc102.prol.loopexit

for.inc102.prol.loopexit:                         ; preds = %for.inc102.prol.loopexit.loopexit, %for.body88.for.inc102_crit_edge
  %indvars.iv104.unr = phi i64 [ %indvars.iv, %for.body88.for.inc102_crit_edge ], [ %78, %for.inc102.prol.loopexit.loopexit ]
  %w.379.unr = phi double [ %80, %for.body88.for.inc102_crit_edge ], [ %sub101.prol, %for.inc102.prol.loopexit.loopexit ]
  %sub101.lcssa.unr = phi double [ undef, %for.body88.for.inc102_crit_edge ], [ %sub101.prol, %for.inc102.prol.loopexit.loopexit ]
  %84 = icmp ult i32 %79, 3
  br i1 %84, label %for.end104, label %for.inc102.preheader

for.inc102.preheader:                             ; preds = %for.inc102.prol.loopexit
  br label %for.inc102

for.inc102:                                       ; preds = %for.inc102.preheader, %for.inc102
  %indvars.iv104 = phi i64 [ %indvars.iv.next105.3, %for.inc102 ], [ %indvars.iv104.unr, %for.inc102.preheader ]
  %w.379 = phi double [ %sub101.3, %for.inc102 ], [ %w.379.unr, %for.inc102.preheader ]
  %arrayidx97 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv174, i64 %indvars.iv104
  %85 = bitcast double* %arrayidx97 to <2 x double>*
  %arrayidx99 = getelementptr inbounds double, double* %x, i64 %indvars.iv104
  %86 = bitcast double* %arrayidx99 to <2 x double>*
  %87 = load <2 x double>, <2 x double>* %85, align 8
  %88 = load <2 x double>, <2 x double>* %86, align 8
  %mul100 = fmul <2 x double> %87, %88
  %mul100.v.r1 = extractelement <2 x double> %mul100, i32 0
  %mul100.v.r2 = extractelement <2 x double> %mul100, i32 1
  %sub101 = fsub double %w.379, %mul100.v.r1
  %sub101.1 = fsub double %sub101, %mul100.v.r2
  %indvars.iv.next105.1 = add nsw i64 %indvars.iv104, 2
  %arrayidx97.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv174, i64 %indvars.iv.next105.1
  %89 = bitcast double* %arrayidx97.2 to <2 x double>*
  %arrayidx99.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next105.1
  %90 = bitcast double* %arrayidx99.2 to <2 x double>*
  %91 = load <2 x double>, <2 x double>* %89, align 8
  %92 = load <2 x double>, <2 x double>* %90, align 8
  %mul100.2 = fmul <2 x double> %91, %92
  %mul100.2.v.r1 = extractelement <2 x double> %mul100.2, i32 0
  %mul100.2.v.r2 = extractelement <2 x double> %mul100.2, i32 1
  %sub101.2 = fsub double %sub101.1, %mul100.2.v.r1
  %sub101.3 = fsub double %sub101.2, %mul100.2.v.r2
  %indvars.iv.next105.3 = add nsw i64 %indvars.iv104, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next105.3, 2000
  br i1 %exitcond.3, label %for.end104.loopexit, label %for.inc102

for.end104.loopexit:                              ; preds = %for.inc102
  br label %for.end104

for.end104:                                       ; preds = %for.end104.loopexit, %for.inc102.prol.loopexit, %for.body88
  %w.3.lcssa = phi double [ %80, %for.body88 ], [ %sub101.lcssa.unr, %for.inc102.prol.loopexit ], [ %sub101.3, %for.end104.loopexit ]
  %arrayidx108 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv174, i64 %indvars.iv174
  %93 = load double, double* %arrayidx108, align 8
  %div109 = fdiv double %w.3.lcssa, %93
  %arrayidx111 = getelementptr inbounds double, double* %x, i64 %indvars.iv174
  store double %div109, double* %arrayidx111, align 8
  %indvars.iv.next175 = add nsw i64 %indvars.iv174, -1
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  %indvar.next = add nuw nsw i32 %indvar, 1
  %exitcond = icmp eq i32 %indvar.next, 2000
  %indvars.iv.next171 = add nsw i64 %indvars.iv170, -1
  %indvars.iv.next173 = add i2 %indvars.iv172, 1
  br i1 %exitcond, label %for.end113, label %for.body88

for.end113:                                       ; preds = %for.end104
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly %x) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.body

for.body:                                         ; preds = %if.end, %entry
  %indvars.iv = phi i64 [ %indvars.iv.next, %if.end ], [ 0, %entry ]
  %3 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #6
  br label %if.end

if.end:                                           ; preds = %for.body, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %if.end
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #6
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
!4 = distinct !{!4, !2}
