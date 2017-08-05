; ModuleID = 'A.ll'
source_filename = "cholesky.c"
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
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %arraydecay = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @init_array([2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_cholesky([2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %1 = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @print_array([2000 x double]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture %A) unnamed_addr #0 {
for.body.lr.ph:
  br label %for.inc.preheader

for.inc.preheader:                                ; preds = %for.body.lr.ph, %for.inc23
  %indvars.iv145 = phi i3 [ %indvars.iv.next146, %for.inc23 ], [ -1, %for.body.lr.ph ]
  %indvars.iv143 = phi i64 [ %indvars.iv.next144, %for.inc23 ], [ 2, %for.body.lr.ph ]
  %indvars.iv113 = phi i64 [ %indvars.iv.next114, %for.inc23 ], [ 0, %for.body.lr.ph ]
  %indvar108 = phi i32 [ %indvar.next109, %for.inc23 ], [ 0, %for.body.lr.ph ]
  %indvars.iv103 = phi i64 [ %indvars.iv.next104, %for.inc23 ], [ 1, %for.body.lr.ph ]
  %0 = zext i3 %indvars.iv145 to i32
  %1 = add i32 %0, -1
  %2 = zext i32 %1 to i64
  %3 = add i64 %indvars.iv143, %2
  %4 = sub i32 2007, %indvar108
  %5 = sub i32 1998, %indvar108
  %wide.trip.count102 = zext i32 %indvar108 to i64
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.preheader
  %indvars.iv97 = phi i64 [ 0, %for.inc.preheader ], [ %indvars.iv.next98, %for.inc ]
  %6 = sub nsw i64 0, %indvars.iv97
  %7 = trunc i64 %6 to i32
  %rem = srem i32 %7, 2000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 2.000000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv113, i64 %indvars.iv97
  store double %add, double* %arrayidx6, align 8
  %exitcond = icmp eq i64 %indvars.iv97, %wide.trip.count102
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97, 1
  br i1 %exitcond, label %for.end, label %for.inc

for.end:                                          ; preds = %for.inc
  %indvars.iv.next114 = add nuw nsw i64 %indvars.iv113, 1
  %cmp964 = icmp slt i64 %indvars.iv.next114, 2000
  br i1 %cmp964, label %for.inc16.lr.ph, label %for.body29.lr.ph.for.body29.us_crit_edge

for.inc16.lr.ph:                                  ; preds = %for.end
  %xtraiter110 = and i32 %4, 7
  %lcmp.mod111 = icmp eq i32 %xtraiter110, 0
  br i1 %lcmp.mod111, label %for.inc16.prol.loopexit, label %for.inc16.prol.preheader

for.inc16.prol.preheader:                         ; preds = %for.inc16.lr.ph
  br label %for.inc16.prol

for.inc16.prol:                                   ; preds = %for.inc16.prol, %for.inc16.prol.preheader
  %indvars.iv105.prol = phi i64 [ %indvars.iv103, %for.inc16.prol.preheader ], [ %indvars.iv.next106.prol, %for.inc16.prol ]
  %prol.iter112 = phi i32 [ %xtraiter110, %for.inc16.prol.preheader ], [ %prol.iter112.sub, %for.inc16.prol ]
  %arrayidx15.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv113, i64 %indvars.iv105.prol
  store double 0.000000e+00, double* %arrayidx15.prol, align 8
  %indvars.iv.next106.prol = add nsw i64 %indvars.iv105.prol, 1
  %prol.iter112.sub = add nsw i32 %prol.iter112, -1
  %prol.iter112.cmp = icmp eq i32 %prol.iter112.sub, 0
  br i1 %prol.iter112.cmp, label %for.inc16.prol.loopexit.loopexit, label %for.inc16.prol, !llvm.loop !1

for.inc16.prol.loopexit.loopexit:                 ; preds = %for.inc16.prol
  br label %for.inc16.prol.loopexit

for.inc16.prol.loopexit:                          ; preds = %for.inc16.prol.loopexit.loopexit, %for.inc16.lr.ph
  %indvars.iv105.unr = phi i64 [ %indvars.iv103, %for.inc16.lr.ph ], [ %3, %for.inc16.prol.loopexit.loopexit ]
  %8 = icmp ult i32 %5, 7
  br i1 %8, label %for.inc23, label %for.inc16.preheader

for.inc16.preheader:                              ; preds = %for.inc16.prol.loopexit
  br label %for.inc16

for.inc16:                                        ; preds = %for.inc16, %for.inc16.preheader
  %indvars.iv105 = phi i64 [ %indvars.iv105.unr, %for.inc16.preheader ], [ %indvars.iv.next106.7, %for.inc16 ]
  %arrayidx15 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv113, i64 %indvars.iv105
  store double 0.000000e+00, double* %arrayidx15, align 8
  %indvars.iv.next106 = add nsw i64 %indvars.iv105, 1
  %arrayidx15.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv113, i64 %indvars.iv.next106
  store double 0.000000e+00, double* %arrayidx15.1, align 8
  %indvars.iv.next106.1 = add nsw i64 %indvars.iv105, 2
  %arrayidx15.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv113, i64 %indvars.iv.next106.1
  store double 0.000000e+00, double* %arrayidx15.2, align 8
  %indvars.iv.next106.2 = add nsw i64 %indvars.iv105, 3
  %arrayidx15.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv113, i64 %indvars.iv.next106.2
  store double 0.000000e+00, double* %arrayidx15.3, align 8
  %indvars.iv.next106.3 = add nsw i64 %indvars.iv105, 4
  %arrayidx15.4 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv113, i64 %indvars.iv.next106.3
  store double 0.000000e+00, double* %arrayidx15.4, align 8
  %indvars.iv.next106.4 = add nsw i64 %indvars.iv105, 5
  %arrayidx15.5 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv113, i64 %indvars.iv.next106.4
  store double 0.000000e+00, double* %arrayidx15.5, align 8
  %indvars.iv.next106.5 = add nsw i64 %indvars.iv105, 6
  %arrayidx15.6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv113, i64 %indvars.iv.next106.5
  store double 0.000000e+00, double* %arrayidx15.6, align 8
  %indvars.iv.next106.6 = add nsw i64 %indvars.iv105, 7
  %arrayidx15.7 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv113, i64 %indvars.iv.next106.6
  store double 0.000000e+00, double* %arrayidx15.7, align 8
  %indvars.iv.next106.7 = add nsw i64 %indvars.iv105, 8
  %lftr.wideiv.7 = trunc i64 %indvars.iv.next106.7 to i32
  %exitcond107.7 = icmp eq i32 %lftr.wideiv.7, 2000
  br i1 %exitcond107.7, label %for.inc23.loopexit, label %for.inc16

for.inc23.loopexit:                               ; preds = %for.inc16
  br label %for.inc23

for.inc23:                                        ; preds = %for.inc23.loopexit, %for.inc16.prol.loopexit
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv113, i64 %indvars.iv113
  store double 1.000000e+00, double* %arrayidx22, align 8
  %indvar.next109 = add i32 %indvar108, 1
  %indvars.iv.next104 = add nuw nsw i64 %indvars.iv103, 1
  %indvars.iv.next144 = add nuw nsw i64 %indvars.iv143, 1
  %indvars.iv.next146 = add i3 %indvars.iv145, -1
  br label %for.inc.preheader

for.body29.lr.ph.for.body29.us_crit_edge:         ; preds = %for.end
  %arrayidx22120 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv113, i64 %indvars.iv113
  store double 1.000000e+00, double* %arrayidx22120, align 8
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %for.body29.us

for.body29.us:                                    ; preds = %for.body29.us, %for.body29.lr.ph.for.body29.us_crit_edge
  %indvars.iv137 = phi i64 [ 0, %for.body29.lr.ph.for.body29.us_crit_edge ], [ %indvars.iv.next138, %for.body29.us ]
  %indvar = phi i32 [ 0, %for.body29.lr.ph.for.body29.us_crit_edge ], [ %indvar.next.4, %for.body29.us ]
  %9 = bitcast i8* %call to [2000 x [2000 x double]]*
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %9, i64 0, i64 %indvars.iv137, i64 0
  %scevgep94 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep94, i8 0, i64 16000, i32 8, i1 false)
  %10 = add nuw nsw i64 %indvars.iv137, 1
  %scevgep.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %9, i64 0, i64 %10, i64 0
  %scevgep94.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep94.1, i8 0, i64 16000, i32 8, i1 false)
  %11 = add nuw nsw i64 %indvars.iv137, 2
  %scevgep.2 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %9, i64 0, i64 %11, i64 0
  %scevgep94.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep94.2, i8 0, i64 16000, i32 8, i1 false)
  %12 = add nuw nsw i64 %indvars.iv137, 3
  %scevgep.3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %9, i64 0, i64 %12, i64 0
  %scevgep94.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep94.3, i8 0, i64 16000, i32 8, i1 false)
  %13 = add nuw nsw i64 %indvars.iv137, 4
  %scevgep.4 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %9, i64 0, i64 %13, i64 0
  %scevgep94.4 = bitcast double* %scevgep.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep94.4, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next.4 = add nuw nsw i32 %indvar, 5
  %cmp27.us.4 = icmp slt i32 %indvar.next.4, 2000
  %indvars.iv.next138 = add nuw nsw i64 %indvars.iv137, 5
  br i1 %cmp27.us.4, label %for.body29.us, label %for.body51.lr.ph.us.preheader

for.body51.lr.ph.us.preheader:                    ; preds = %for.body29.us
  br label %for.body51.lr.ph.us

for.inc75.us:                                     ; preds = %for.cond52.for.inc72_crit_edge.us.us
  %indvars.iv.next88 = add nuw nsw i64 %indvars.iv87, 1
  %cmp45.us = icmp slt i64 %indvars.iv.next88, 2000
  br i1 %cmp45.us, label %for.body51.lr.ph.us, label %for.inc94.us.preheader.preheader

for.inc94.us.preheader.preheader:                 ; preds = %for.inc75.us
  br label %for.inc94.us.preheader

for.body51.lr.ph.us:                              ; preds = %for.inc75.us, %for.body51.lr.ph.us.preheader
  %indvars.iv87 = phi i64 [ 0, %for.body51.lr.ph.us.preheader ], [ %indvars.iv.next88, %for.inc75.us ]
  br label %for.inc69.us.us.preheader

for.inc69.us.us.preheader:                        ; preds = %for.cond52.for.inc72_crit_edge.us.us, %for.body51.lr.ph.us
  %indvars.iv135 = phi i64 [ 0, %for.body51.lr.ph.us ], [ %indvars.iv.next136, %for.cond52.for.inc72_crit_edge.us.us ]
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv135, i64 %indvars.iv87
  br label %for.inc69.us.us

for.cond52.for.inc72_crit_edge.us.us:             ; preds = %for.inc69.us.us
  %indvars.iv.next136 = add nuw i64 %indvars.iv135, 1
  %cmp49.us.us = icmp slt i64 %indvars.iv.next136, 2000
  br i1 %cmp49.us.us, label %for.inc69.us.us.preheader, label %for.inc75.us

for.inc69.us.us:                                  ; preds = %for.inc69.us.us, %for.inc69.us.us.preheader
  %indvars.iv81 = phi i64 [ 0, %for.inc69.us.us.preheader ], [ %indvars.iv.next82.1, %for.inc69.us.us ]
  %14 = bitcast i8* %call to [2000 x [2000 x double]]*
  %15 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv81, i64 %indvars.iv87
  %16 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %15, %16
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %14, i64 0, i64 %indvars.iv135, i64 %indvars.iv81
  %17 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %mul.us.us, %17
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %indvars.iv.next82 = or i64 %indvars.iv81, 1
  %18 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next82, i64 %indvars.iv87
  %19 = load double, double* %arrayidx63.us.us.1, align 8
  %mul.us.us.1 = fmul double %18, %19
  %arrayidx67.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %14, i64 0, i64 %indvars.iv135, i64 %indvars.iv.next82
  %20 = load double, double* %arrayidx67.us.us.1, align 8
  %add68.us.us.1 = fadd double %mul.us.us.1, %20
  store double %add68.us.us.1, double* %arrayidx67.us.us.1, align 8
  %indvars.iv.next82.1 = add nuw nsw i64 %indvars.iv81, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next82.1, 2000
  br i1 %exitcond.1, label %for.cond52.for.inc72_crit_edge.us.us, label %for.inc69.us.us

for.inc94.us.preheader:                           ; preds = %for.cond82.for.inc97_crit_edge.us, %for.inc94.us.preheader.preheader
  %indvars.iv133 = phi i64 [ 0, %for.inc94.us.preheader.preheader ], [ %indvars.iv.next134, %for.cond82.for.inc97_crit_edge.us ]
  br label %for.inc94.us

for.inc94.us:                                     ; preds = %for.inc94.us, %for.inc94.us.preheader
  %indvars.iv = phi i64 [ 0, %for.inc94.us.preheader ], [ %indvars.iv.next.3, %for.inc94.us ]
  %21 = bitcast i8* %call to [2000 x [2000 x double]]*
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv133, i64 %indvars.iv
  %22 = bitcast double* %arrayidx89.us to i64*
  %23 = load i64, i64* %22, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv133, i64 %indvars.iv
  %24 = bitcast double* %arrayidx93.us to i64*
  store i64 %23, i64* %24, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv133, i64 %indvars.iv.next
  %25 = bitcast double* %arrayidx89.us.1 to i64*
  %26 = load i64, i64* %25, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv133, i64 %indvars.iv.next
  %27 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %26, i64* %27, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv133, i64 %indvars.iv.next.1
  %28 = bitcast double* %arrayidx89.us.2 to i64*
  %29 = load i64, i64* %28, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv133, i64 %indvars.iv.next.1
  %30 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %29, i64* %30, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv133, i64 %indvars.iv.next.2
  %31 = bitcast double* %arrayidx89.us.3 to i64*
  %32 = load i64, i64* %31, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv133, i64 %indvars.iv.next.2
  %33 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %32, i64* %33, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond.3, label %for.cond82.for.inc97_crit_edge.us, label %for.inc94.us

for.cond82.for.inc97_crit_edge.us:                ; preds = %for.inc94.us
  %indvars.iv.next134 = add nuw i64 %indvars.iv133, 1
  %cmp79.us = icmp slt i64 %indvars.iv.next134, 2000
  br i1 %cmp79.us, label %for.inc94.us.preheader, label %for.end99

for.end99:                                        ; preds = %for.cond82.for.inc97_crit_edge.us
  tail call void @free(i8* %call) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky([2000 x double]* %A) unnamed_addr #0 {
for.body.lr.ph:
  %A.addr = alloca [2000 x double]*, align 8
  store [2000 x double]* %A, [2000 x double]** %A.addr, align 8
  br label %for.body

for.body:                                         ; preds = %for.inc56, %for.body.lr.ph
  %0 = phi [2000 x double]* [ %A, %for.body.lr.ph ], [ %31, %for.inc56 ]
  %indvars.iv37 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next38, %for.inc56 ]
  %indvar = phi i32 [ 0, %for.body.lr.ph ], [ %indvar.next, %for.inc56 ]
  %1 = add nsw i64 %indvars.iv37, -2
  %cmp25 = icmp sgt i64 %indvars.iv37, 0
  br i1 %cmp25, label %for.cond4.preheader.preheader, label %for.cond28.preheader.for.inc56_crit_edge

for.cond4.preheader.preheader:                    ; preds = %for.body
  %wide.trip.count28 = zext i32 %indvar to i64
  br label %for.cond4.preheader

for.cond28.preheader.for.inc56_crit_edge:         ; preds = %for.body
  %.pre43 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv37, i64 %indvars.iv37
  br label %for.inc56

for.inc45.lr.ph:                                  ; preds = %for.inc25
  %.pre40 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre40, i64 %indvars.iv37, i64 %indvars.iv37
  %xtraiter34 = and i32 %indvar, 1
  %lcmp.mod35 = icmp eq i32 %xtraiter34, 0
  br i1 %lcmp.mod35, label %for.inc45.prol.loopexit.unr-lcssa, label %for.inc45.prol.preheader

for.inc45.prol.preheader:                         ; preds = %for.inc45.lr.ph
  %arrayidx34.prol = getelementptr inbounds [2000 x double], [2000 x double]* %.pre40, i64 %indvars.iv37, i64 0
  %2 = load double, double* %arrayidx34.prol, align 8
  %mul39.prol = fmul double %2, %2
  %3 = load double, double* %arrayidx43, align 8
  %sub44.prol = fsub double %3, %mul39.prol
  store double %sub44.prol, double* %arrayidx43, align 8
  br label %for.inc45.prol.loopexit.unr-lcssa

for.inc45.prol.loopexit.unr-lcssa:                ; preds = %for.inc45.lr.ph, %for.inc45.prol.preheader
  %indvars.iv29.unr.ph = phi i64 [ 1, %for.inc45.prol.preheader ], [ 0, %for.inc45.lr.ph ]
  %4 = icmp eq i32 %indvar, 1
  br i1 %4, label %for.inc56, label %for.inc45.lr.ph.new

for.inc45.lr.ph.new:                              ; preds = %for.inc45.prol.loopexit.unr-lcssa
  %.pre41 = load double, double* %arrayidx43, align 8
  %5 = sub i64 %1, %indvars.iv29.unr.ph
  %6 = lshr i64 %5, 1
  %7 = and i64 %6, 1
  %lcmp.mod46 = icmp eq i64 %7, 0
  br i1 %lcmp.mod46, label %for.inc45.prol.preheader45, label %for.inc45.prol.loopexit.unr-lcssa50

for.inc45.prol.preheader45:                       ; preds = %for.inc45.lr.ph.new
  %arrayidx34.prol47 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre40, i64 %indvars.iv37, i64 %indvars.iv29.unr.ph
  %8 = load double, double* %arrayidx34.prol47, align 8
  %mul39.prol48 = fmul double %8, %8
  %sub44.prol49 = fsub double %.pre41, %mul39.prol48
  store double %sub44.prol49, double* %arrayidx43, align 8
  %indvars.iv.next30.prol = add nuw nsw i64 %indvars.iv29.unr.ph, 1
  %arrayidx34.1.prol = getelementptr inbounds [2000 x double], [2000 x double]* %.pre40, i64 %indvars.iv37, i64 %indvars.iv.next30.prol
  %9 = load double, double* %arrayidx34.1.prol, align 8
  %mul39.1.prol = fmul double %9, %9
  %sub44.1.prol = fsub double %sub44.prol49, %mul39.1.prol
  store double %sub44.1.prol, double* %arrayidx43, align 8
  %indvars.iv.next30.1.prol = or i64 %indvars.iv29.unr.ph, 2
  br label %for.inc45.prol.loopexit.unr-lcssa50

for.inc45.prol.loopexit.unr-lcssa50:              ; preds = %for.inc45.lr.ph.new, %for.inc45.prol.preheader45
  %.unr.ph = phi double [ %sub44.1.prol, %for.inc45.prol.preheader45 ], [ %.pre41, %for.inc45.lr.ph.new ]
  %indvars.iv29.unr.ph51 = phi i64 [ %indvars.iv.next30.1.prol, %for.inc45.prol.preheader45 ], [ %indvars.iv29.unr.ph, %for.inc45.lr.ph.new ]
  %10 = icmp eq i64 %6, 0
  br i1 %10, label %for.inc56, label %for.inc45.lr.ph.new.new

for.inc45.lr.ph.new.new:                          ; preds = %for.inc45.prol.loopexit.unr-lcssa50
  br label %for.inc45

for.cond4.preheader:                              ; preds = %for.inc25, %for.cond4.preheader.preheader
  %11 = phi [2000 x double]* [ %0, %for.cond4.preheader.preheader ], [ %23, %for.inc25 ]
  %indvars.iv24 = phi i64 [ 0, %for.cond4.preheader.preheader ], [ %indvars.iv.next25, %for.inc25 ]
  %12 = add nuw i64 %indvars.iv24, 4294967295
  %cmp53 = icmp sgt i64 %indvars.iv24, 0
  br i1 %cmp53, label %for.inc.lr.ph, label %for.inc25

for.inc.lr.ph:                                    ; preds = %for.cond4.preheader
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %11, i64 %indvars.iv37, i64 %indvars.iv24
  %xtraiter44 = and i64 %indvars.iv24, 1
  %lcmp.mod = icmp eq i64 %xtraiter44, 0
  br i1 %lcmp.mod, label %for.inc.prol.loopexit.unr-lcssa, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.lr.ph
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %11, i64 %indvars.iv37, i64 0
  %13 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %11, i64 %indvars.iv24, i64 0
  %14 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %13, %14
  %15 = load double, double* %arrayidx16, align 8
  %sub.prol = fsub double %15, %mul.prol
  store double %sub.prol, double* %arrayidx16, align 8
  br label %for.inc.prol.loopexit.unr-lcssa

for.inc.prol.loopexit.unr-lcssa:                  ; preds = %for.inc.lr.ph, %for.inc.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.prol.preheader ], [ 0, %for.inc.lr.ph ]
  %16 = trunc i64 %12 to i32
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %for.inc25.loopexit, label %for.inc.lr.ph.new

for.inc.lr.ph.new:                                ; preds = %for.inc.prol.loopexit.unr-lcssa
  %.pre = load double, double* %arrayidx16, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph.new
  %18 = phi double [ %.pre, %for.inc.lr.ph.new ], [ %sub.1, %for.inc ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.inc.lr.ph.new ], [ %indvars.iv.next.1, %for.inc ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %11, i64 %indvars.iv37, i64 %indvars.iv
  %19 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %11, i64 %indvars.iv24, i64 %indvars.iv
  %20 = load double, double* %arrayidx12, align 8
  %mul = fmul double %19, %20
  %sub = fsub double %18, %mul
  store double %sub, double* %arrayidx16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %11, i64 %indvars.iv37, i64 %indvars.iv.next
  %21 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %11, i64 %indvars.iv24, i64 %indvars.iv.next
  %22 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %21, %22
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv24
  br i1 %exitcond.1, label %for.inc25.loopexit.loopexit, label %for.inc

for.inc25.loopexit.loopexit:                      ; preds = %for.inc
  br label %for.inc25.loopexit

for.inc25.loopexit:                               ; preds = %for.inc25.loopexit.loopexit, %for.inc.prol.loopexit.unr-lcssa
  %.pre39 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.inc25

for.inc25:                                        ; preds = %for.cond4.preheader, %for.inc25.loopexit
  %23 = phi [2000 x double]* [ %.pre39, %for.inc25.loopexit ], [ %11, %for.cond4.preheader ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %11, i64 %indvars.iv24, i64 %indvars.iv24
  %24 = load double, double* %arrayidx20, align 8
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %23, i64 %indvars.iv37, i64 %indvars.iv24
  %25 = load double, double* %arrayidx24, align 8
  %div = fdiv double %25, %24
  store double %div, double* %arrayidx24, align 8
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond = icmp eq i64 %indvars.iv.next25, %wide.trip.count28
  br i1 %exitcond, label %for.inc45.lr.ph, label %for.cond4.preheader

for.inc45:                                        ; preds = %for.inc45, %for.inc45.lr.ph.new.new
  %26 = phi double [ %.unr.ph, %for.inc45.lr.ph.new.new ], [ %sub44.1.1, %for.inc45 ]
  %indvars.iv29 = phi i64 [ %indvars.iv29.unr.ph51, %for.inc45.lr.ph.new.new ], [ %indvars.iv.next30.1.1, %for.inc45 ]
  %arrayidx34 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre40, i64 %indvars.iv37, i64 %indvars.iv29
  %27 = load double, double* %arrayidx34, align 8
  %mul39 = fmul double %27, %27
  %sub44 = fsub double %26, %mul39
  store double %sub44, double* %arrayidx43, align 8
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %arrayidx34.1 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre40, i64 %indvars.iv37, i64 %indvars.iv.next30
  %28 = load double, double* %arrayidx34.1, align 8
  %mul39.1 = fmul double %28, %28
  %sub44.1 = fsub double %sub44, %mul39.1
  store double %sub44.1, double* %arrayidx43, align 8
  %indvars.iv.next30.1 = add nsw i64 %indvars.iv29, 2
  %arrayidx34.152 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre40, i64 %indvars.iv37, i64 %indvars.iv.next30.1
  %29 = load double, double* %arrayidx34.152, align 8
  %mul39.153 = fmul double %29, %29
  %sub44.154 = fsub double %sub44.1, %mul39.153
  store double %sub44.154, double* %arrayidx43, align 8
  %indvars.iv.next30.155 = add nsw i64 %indvars.iv29, 3
  %arrayidx34.1.1 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre40, i64 %indvars.iv37, i64 %indvars.iv.next30.155
  %30 = load double, double* %arrayidx34.1.1, align 8
  %mul39.1.1 = fmul double %30, %30
  %sub44.1.1 = fsub double %sub44.154, %mul39.1.1
  store double %sub44.1.1, double* %arrayidx43, align 8
  %indvars.iv.next30.1.1 = add nsw i64 %indvars.iv29, 4
  %exitcond33.1.1 = icmp eq i64 %indvars.iv.next30.1.1, %wide.trip.count28
  br i1 %exitcond33.1.1, label %for.inc56.loopexit, label %for.inc45

for.inc56.loopexit:                               ; preds = %for.inc45
  br label %for.inc56

for.inc56:                                        ; preds = %for.inc56.loopexit, %for.inc45.prol.loopexit.unr-lcssa50, %for.inc45.prol.loopexit.unr-lcssa, %for.cond28.preheader.for.inc56_crit_edge
  %arrayidx51.pre-phi = phi double* [ %.pre43, %for.cond28.preheader.for.inc56_crit_edge ], [ %arrayidx43, %for.inc45.prol.loopexit.unr-lcssa ], [ %arrayidx43, %for.inc45.prol.loopexit.unr-lcssa50 ], [ %arrayidx43, %for.inc56.loopexit ]
  %31 = phi [2000 x double]* [ %0, %for.cond28.preheader.for.inc56_crit_edge ], [ %.pre40, %for.inc45.prol.loopexit.unr-lcssa ], [ %.pre40, %for.inc45.prol.loopexit.unr-lcssa50 ], [ %.pre40, %for.inc56.loopexit ]
  %32 = load double, double* %arrayidx51.pre-phi, align 8
  %call = tail call double @sqrt(double %32) #3
  %arrayidx55 = getelementptr inbounds [2000 x double], [2000 x double]* %31, i64 %indvars.iv37, i64 %indvars.iv37
  store double %call, double* %arrayidx55, align 8
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %indvar.next = add i32 %indvar, 1
  %cmp = icmp slt i64 %indvars.iv.next38, 2000
  br i1 %cmp, label %for.body, label %for.end58

for.end58:                                        ; preds = %for.inc56
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly %A) unnamed_addr #0 {
for.body.lr.ph:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body4.preheader

for.body4.preheader:                              ; preds = %for.body.lr.ph, %for.inc10
  %indvars.iv8 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next9, %for.inc10 ]
  %3 = mul nsw i64 %indvars.iv8, 2000
  br label %for.body4

for.body4:                                        ; preds = %for.inc, %for.body4.preheader
  %indvars.iv = phi i64 [ 0, %for.body4.preheader ], [ %indvars.iv.next, %for.inc ]
  %4 = add nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body4, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv8, i64 %indvars.iv
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %cmp3 = icmp slt i64 %indvars.iv, %indvars.iv8
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  br i1 %cmp3, label %for.body4, label %for.inc10

for.inc10:                                        ; preds = %for.inc
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %cmp = icmp slt i64 %indvars.iv.next9, 2000
  br i1 %cmp, label %for.body4.preheader, label %for.end12

for.end12:                                        ; preds = %for.inc10
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { argmemonly nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
