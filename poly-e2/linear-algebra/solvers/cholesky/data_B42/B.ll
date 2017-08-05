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
  %call = call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %arraydecay = bitcast i8* %call to [2000 x double]*
  call fastcc void @init_array([2000 x double]* %arraydecay)
  call void (...) @polybench_timer_start() #3
  call fastcc void @kernel_cholesky([2000 x double]* %arraydecay)
  call void (...) @polybench_timer_stop() #3
  call void (...) @polybench_timer_print() #3
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %1 = bitcast i8* %call to [2000 x double]*
  call fastcc void @print_array([2000 x double]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* %A) unnamed_addr #0 {
for.body.lr.ph:
  br label %for.body

for.body:                                         ; preds = %for.inc23.for.body_crit_edge, %for.body.lr.ph
  %indvars.iv107 = phi i64 [ %indvars.iv.next108, %for.inc23.for.body_crit_edge ], [ 0, %for.body.lr.ph ]
  %indvars.iv92 = phi i32 [ %indvars.iv.next93, %for.inc23.for.body_crit_edge ], [ 0, %for.body.lr.ph ]
  %indvars.iv.next108 = add i64 %indvars.iv107, 1
  %sext = shl i64 %indvars.iv.next108, 32
  %0 = ashr exact i64 %sext, 32
  %scevgep105 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv107, i64 %0
  %1 = sub i64 1998, %indvars.iv107
  %2 = shl i64 %1, 3
  %3 = and i64 %2, 34359738360
  %4 = add nuw nsw i64 %3, 8
  %cmp257 = icmp sgt i64 %indvars.iv107, -1
  br i1 %cmp257, label %for.inc.preheader, label %for.end

for.inc.preheader:                                ; preds = %for.body
  %wide.trip.count94 = zext i32 %indvars.iv92 to i64
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.preheader
  %indvars.iv89 = phi i64 [ 0, %for.inc.preheader ], [ %indvars.iv.next90, %for.inc ]
  %5 = sub nsw i64 0, %indvars.iv89
  %6 = trunc i64 %5 to i32
  %rem = srem i32 %6, 2000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 2.000000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv107, i64 %indvars.iv89
  store double %add, double* %arrayidx6, align 8
  %exitcond95 = icmp eq i64 %indvars.iv89, %wide.trip.count94
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1
  br i1 %exitcond95, label %for.end.loopexit, label %for.inc

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body
  %cmp959 = icmp slt i64 %indvars.iv.next108, 2000
  br i1 %cmp959, label %for.inc23.for.body_crit_edge, label %for.body29.lr.ph.for.body29.us_crit_edge

for.inc23.for.body_crit_edge:                     ; preds = %for.end
  %7 = bitcast double* %scevgep105 to i8*
  call void @llvm.memset.p0i8.i64(i8* %7, i8 0, i64 %4, i32 8, i1 false)
  %arrayidx22111 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv107, i64 %indvars.iv107
  store double 1.000000e+00, double* %arrayidx22111, align 8
  %indvars.iv.next93 = add i32 %indvars.iv92, 1
  br label %for.body

for.body29.lr.ph.for.body29.us_crit_edge:         ; preds = %for.end
  %arrayidx22113 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv107, i64 %indvars.iv107
  store double 1.000000e+00, double* %arrayidx22113, align 8
  %call = call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %for.body29.us

for.body29.us:                                    ; preds = %for.body29.us, %for.body29.lr.ph.for.body29.us_crit_edge
  %indvars.iv86 = phi i64 [ 0, %for.body29.lr.ph.for.body29.us_crit_edge ], [ %indvars.iv.next87.4, %for.body29.us ]
  %8 = bitcast i8* %call to [2000 x [2000 x double]]*
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %8, i64 0, i64 %indvars.iv86, i64 0
  %scevgep85 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep85, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next = add nuw nsw i64 %indvars.iv86, 1
  %scevgep.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %8, i64 0, i64 %indvar.next, i64 0
  %scevgep85.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep85.1, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next.1 = add nuw nsw i64 %indvars.iv86, 2
  %scevgep.2 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %8, i64 0, i64 %indvar.next.1, i64 0
  %scevgep85.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep85.2, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next.2 = add nuw nsw i64 %indvars.iv86, 3
  %scevgep.3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %8, i64 0, i64 %indvar.next.2, i64 0
  %scevgep85.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep85.3, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next.3 = add nuw nsw i64 %indvars.iv86, 4
  %scevgep.4 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %8, i64 0, i64 %indvar.next.3, i64 0
  %scevgep85.4 = bitcast double* %scevgep.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep85.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next87.4 = add nuw nsw i64 %indvars.iv86, 5
  %cmp27.us.4 = icmp slt i64 %indvars.iv.next87.4, 2000
  br i1 %cmp27.us.4, label %for.body29.us, label %for.body47.us.for.body51.us.us_crit_edge.preheader

for.body47.us.for.body51.us.us_crit_edge.preheader: ; preds = %for.body29.us
  br label %for.body47.us.for.body51.us.us_crit_edge

for.body47.us.for.body51.us.us_crit_edge:         ; preds = %for.cond48.for.inc75_crit_edge.us, %for.body47.us.for.body51.us.us_crit_edge.preheader
  %indvars.iv78 = phi i64 [ 0, %for.body47.us.for.body51.us.us_crit_edge.preheader ], [ %indvars.iv.next79, %for.cond48.for.inc75_crit_edge.us ]
  br label %for.body51.us.us

for.cond48.for.inc75_crit_edge.us:                ; preds = %for.cond52.for.inc72_crit_edge.us.us
  %indvars.iv.next79 = add i64 %indvars.iv78, 1
  %cmp45.us = icmp slt i64 %indvars.iv.next79, 2000
  br i1 %cmp45.us, label %for.body47.us.for.body51.us.us_crit_edge, label %for.body81.us.preheader

for.body81.us.preheader:                          ; preds = %for.cond48.for.inc75_crit_edge.us
  br label %for.body81.us

for.body51.us.us:                                 ; preds = %for.cond52.for.inc72_crit_edge.us.us, %for.body47.us.for.body51.us.us_crit_edge
  %indvars.iv76 = phi i64 [ 0, %for.body47.us.for.body51.us.us_crit_edge ], [ %indvars.iv.next77, %for.cond52.for.inc72_crit_edge.us.us ]
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv76, i64 %indvars.iv78
  br label %for.inc69.us.us

for.cond52.for.inc72_crit_edge.us.us:             ; preds = %for.inc69.us.us
  %indvars.iv.next77 = add nuw i64 %indvars.iv76, 1
  %cmp49.us.us = icmp slt i64 %indvars.iv.next77, 2000
  br i1 %cmp49.us.us, label %for.body51.us.us, label %for.cond48.for.inc75_crit_edge.us

for.inc69.us.us:                                  ; preds = %for.inc69.us.us, %for.body51.us.us
  %indvars.iv72 = phi i64 [ 0, %for.body51.us.us ], [ %indvars.iv.next73.1, %for.inc69.us.us ]
  %9 = bitcast i8* %call to [2000 x [2000 x double]]*
  %10 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv72, i64 %indvars.iv78
  %11 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %10, %11
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %9, i64 0, i64 %indvars.iv76, i64 %indvars.iv72
  %12 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %mul.us.us, %12
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %indvars.iv.next73 = or i64 %indvars.iv72, 1
  %13 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next73, i64 %indvars.iv78
  %14 = load double, double* %arrayidx63.us.us.1, align 8
  %mul.us.us.1 = fmul double %13, %14
  %arrayidx67.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %9, i64 0, i64 %indvars.iv76, i64 %indvars.iv.next73
  %15 = load double, double* %arrayidx67.us.us.1, align 8
  %add68.us.us.1 = fadd double %mul.us.us.1, %15
  store double %add68.us.us.1, double* %arrayidx67.us.us.1, align 8
  %exitcond75.1 = icmp eq i64 %indvars.iv.next73, 1999
  %indvars.iv.next73.1 = add nuw nsw i64 %indvars.iv72, 2
  br i1 %exitcond75.1, label %for.cond52.for.inc72_crit_edge.us.us, label %for.inc69.us.us

for.body81.us:                                    ; preds = %for.cond82.for.inc97_crit_edge.us, %for.body81.us.preheader
  %indvars.iv69 = phi i64 [ 0, %for.body81.us.preheader ], [ %indvars.iv.next70, %for.cond82.for.inc97_crit_edge.us ]
  br label %for.inc94.us

for.inc94.us:                                     ; preds = %for.inc94.us, %for.body81.us
  %indvars.iv = phi i64 [ 0, %for.body81.us ], [ %indvars.iv.next.4, %for.inc94.us ]
  %16 = bitcast i8* %call to [2000 x [2000 x double]]*
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %16, i64 0, i64 %indvars.iv69, i64 %indvars.iv
  %17 = bitcast double* %arrayidx89.us to i64*
  %18 = load i64, i64* %17, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv69, i64 %indvars.iv
  %19 = bitcast double* %arrayidx93.us to i64*
  store i64 %18, i64* %19, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %16, i64 0, i64 %indvars.iv69, i64 %indvars.iv.next
  %20 = bitcast double* %arrayidx89.us.1 to i64*
  %21 = load i64, i64* %20, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv69, i64 %indvars.iv.next
  %22 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %21, i64* %22, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %16, i64 0, i64 %indvars.iv69, i64 %indvars.iv.next.1
  %23 = bitcast double* %arrayidx89.us.2 to i64*
  %24 = load i64, i64* %23, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv69, i64 %indvars.iv.next.1
  %25 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %24, i64* %25, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %16, i64 0, i64 %indvars.iv69, i64 %indvars.iv.next.2
  %26 = bitcast double* %arrayidx89.us.3 to i64*
  %27 = load i64, i64* %26, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv69, i64 %indvars.iv.next.2
  %28 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %27, i64* %28, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %arrayidx89.us.4 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %16, i64 0, i64 %indvars.iv69, i64 %indvars.iv.next.3
  %29 = bitcast double* %arrayidx89.us.4 to i64*
  %30 = load i64, i64* %29, align 8
  %arrayidx93.us.4 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv69, i64 %indvars.iv.next.3
  %31 = bitcast double* %arrayidx93.us.4 to i64*
  store i64 %30, i64* %31, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %for.cond82.for.inc97_crit_edge.us, label %for.inc94.us

for.cond82.for.inc97_crit_edge.us:                ; preds = %for.inc94.us
  %indvars.iv.next70 = add i64 %indvars.iv69, 1
  %cmp79.us = icmp slt i64 %indvars.iv.next70, 2000
  br i1 %cmp79.us, label %for.body81.us, label %for.end99

for.end99:                                        ; preds = %for.cond82.for.inc97_crit_edge.us
  call void @free(i8* %call) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky([2000 x double]* nocapture %A) unnamed_addr #0 {
for.body.lr.ph:
  br label %for.body

for.body:                                         ; preds = %for.inc56.for.body_crit_edge, %for.body.lr.ph
  %indvars.iv31 = phi i2 [ %indvars.iv.next32, %for.inc56.for.body_crit_edge ], [ 0, %for.body.lr.ph ]
  %indvars.iv23 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next24, %for.inc56.for.body_crit_edge ]
  %indvars.iv19 = phi i32 [ -1, %for.body.lr.ph ], [ %indvars.iv.next20, %for.inc56.for.body_crit_edge ]
  %0 = zext i2 %indvars.iv31 to i64
  %1 = add i64 %indvars.iv23, 4294967295
  %2 = and i64 %1, 4294967295
  %cmp23 = icmp sgt i64 %indvars.iv23, 0
  br i1 %cmp23, label %for.body3.preheader, label %for.end27.for.inc56_crit_edge

for.body3.preheader:                              ; preds = %for.body
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv23, i64 0
  br label %for.body3

for.body3:                                        ; preds = %for.inc25, %for.body3.preheader
  %indvars.iv15 = phi i64 [ 0, %for.body3.preheader ], [ %indvars.iv.next16, %for.inc25 ]
  %indvars.iv13 = phi i32 [ -1, %for.body3.preheader ], [ %indvars.iv.next14, %for.inc25 ]
  %3 = add i64 %indvars.iv15, 4294967295
  %4 = and i64 %3, 4294967295
  %cmp51 = icmp sgt i64 %indvars.iv15, 0
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv23, i64 %indvars.iv15
  %.pre = load double, double* %arrayidx16, align 8
  br i1 %cmp51, label %for.inc.lr.ph, label %for.inc25

for.inc.lr.ph:                                    ; preds = %for.body3
  %wide.trip.count = zext i32 %indvars.iv13 to i64
  %5 = and i64 %3, 1
  %lcmp.mod = icmp eq i64 %5, 0
  br i1 %lcmp.mod, label %for.inc.prol.preheader, label %for.inc.prol.loopexit.unr-lcssa

for.inc.prol.preheader:                           ; preds = %for.inc.lr.ph
  %6 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv15, i64 0
  %7 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %6, %7
  %sub.prol = fsub double %.pre, %mul.prol
  store double %sub.prol, double* %arrayidx16, align 8
  br label %for.inc.prol.loopexit.unr-lcssa

for.inc.prol.loopexit.unr-lcssa:                  ; preds = %for.inc.lr.ph, %for.inc.prol.preheader
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.inc.prol.preheader ], [ undef, %for.inc.lr.ph ]
  %.unr.ph = phi double [ %sub.prol, %for.inc.prol.preheader ], [ %.pre, %for.inc.lr.ph ]
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.prol.preheader ], [ 0, %for.inc.lr.ph ]
  %8 = icmp eq i64 %4, 0
  br i1 %8, label %for.inc25, label %for.inc.lr.ph.new

for.inc.lr.ph.new:                                ; preds = %for.inc.prol.loopexit.unr-lcssa
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph.new
  %9 = phi double [ %.unr.ph, %for.inc.lr.ph.new ], [ %sub.1, %for.inc ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.inc.lr.ph.new ], [ %indvars.iv.next.1, %for.inc ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv23, i64 %indvars.iv
  %10 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv15, i64 %indvars.iv
  %11 = load double, double* %arrayidx12, align 8
  %mul = fmul double %10, %11
  %sub = fsub double %9, %mul
  store double %sub, double* %arrayidx16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv23, i64 %indvars.iv.next
  %12 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv15, i64 %indvars.iv.next
  %13 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %12, %13
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %for.inc25.loopexit, label %for.inc

for.inc25.loopexit:                               ; preds = %for.inc
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.loopexit, %for.inc.prol.loopexit.unr-lcssa, %for.body3
  %14 = phi double [ %.pre, %for.body3 ], [ %sub.lcssa.unr.ph, %for.inc.prol.loopexit.unr-lcssa ], [ %sub.1, %for.inc25.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv15, i64 %indvars.iv15
  %15 = load double, double* %arrayidx20, align 8
  %div = fdiv double %14, %15
  store double %div, double* %arrayidx16, align 8
  %indvars.iv.next16 = add nuw i64 %indvars.iv15, 1
  %cmp2 = icmp slt i64 %indvars.iv.next16, %indvars.iv23
  %indvars.iv.next14 = add nsw i32 %indvars.iv13, 1
  br i1 %cmp2, label %for.body3, label %for.inc45.lr.ph

for.end27.for.inc56_crit_edge:                    ; preds = %for.body
  %arrayidx51.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv23, i64 %indvars.iv23
  %.pre27 = load double, double* %arrayidx51.phi.trans.insert, align 8
  br label %for.inc56

for.inc45.lr.ph:                                  ; preds = %for.inc25
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv23, i64 %indvars.iv23
  %.pre26 = load double, double* %arrayidx43, align 8
  %wide.trip.count21 = zext i32 %indvars.iv19 to i64
  %xtraiter28 = and i64 %indvars.iv23, 3
  %lcmp.mod29 = icmp eq i64 %xtraiter28, 0
  br i1 %lcmp.mod29, label %for.inc45.prol.loopexit, label %for.inc45.prol.preheader

for.inc45.prol.preheader:                         ; preds = %for.inc45.lr.ph
  br label %for.inc45.prol

for.inc45.prol:                                   ; preds = %for.inc45.prol, %for.inc45.prol.preheader
  %16 = phi double [ %.pre26, %for.inc45.prol.preheader ], [ %sub44.prol, %for.inc45.prol ]
  %indvars.iv17.prol = phi i64 [ 0, %for.inc45.prol.preheader ], [ %indvars.iv.next18.prol, %for.inc45.prol ]
  %prol.iter = phi i64 [ %xtraiter28, %for.inc45.prol.preheader ], [ %prol.iter.sub, %for.inc45.prol ]
  %arrayidx34.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv23, i64 %indvars.iv17.prol
  %17 = load double, double* %arrayidx34.prol, align 8
  %mul39.prol = fmul double %17, %17
  %sub44.prol = fsub double %16, %mul39.prol
  store double %sub44.prol, double* %arrayidx43, align 8
  %indvars.iv.next18.prol = add nuw nsw i64 %indvars.iv17.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc45.prol.loopexit.loopexit, label %for.inc45.prol, !llvm.loop !1

for.inc45.prol.loopexit.loopexit:                 ; preds = %for.inc45.prol
  br label %for.inc45.prol.loopexit

for.inc45.prol.loopexit:                          ; preds = %for.inc45.prol.loopexit.loopexit, %for.inc45.lr.ph
  %sub44.lcssa.unr = phi double [ undef, %for.inc45.lr.ph ], [ %sub44.prol, %for.inc45.prol.loopexit.loopexit ]
  %.unr30 = phi double [ %.pre26, %for.inc45.lr.ph ], [ %sub44.prol, %for.inc45.prol.loopexit.loopexit ]
  %indvars.iv17.unr = phi i64 [ 0, %for.inc45.lr.ph ], [ %0, %for.inc45.prol.loopexit.loopexit ]
  %18 = icmp ult i64 %2, 3
  br i1 %18, label %for.inc56, label %for.inc45.lr.ph.new

for.inc45.lr.ph.new:                              ; preds = %for.inc45.prol.loopexit
  br label %for.inc45

for.inc45:                                        ; preds = %for.inc45, %for.inc45.lr.ph.new
  %19 = phi double [ %.unr30, %for.inc45.lr.ph.new ], [ %sub44.3, %for.inc45 ]
  %indvars.iv17 = phi i64 [ %indvars.iv17.unr, %for.inc45.lr.ph.new ], [ %indvars.iv.next18.3, %for.inc45 ]
  %arrayidx34 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv23, i64 %indvars.iv17
  %20 = load double, double* %arrayidx34, align 8
  %mul39 = fmul double %20, %20
  %sub44 = fsub double %19, %mul39
  store double %sub44, double* %arrayidx43, align 8
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %arrayidx34.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv23, i64 %indvars.iv.next18
  %21 = load double, double* %arrayidx34.1, align 8
  %mul39.1 = fmul double %21, %21
  %sub44.1 = fsub double %sub44, %mul39.1
  store double %sub44.1, double* %arrayidx43, align 8
  %indvars.iv.next18.1 = add nsw i64 %indvars.iv17, 2
  %arrayidx34.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv23, i64 %indvars.iv.next18.1
  %22 = load double, double* %arrayidx34.2, align 8
  %mul39.2 = fmul double %22, %22
  %sub44.2 = fsub double %sub44.1, %mul39.2
  store double %sub44.2, double* %arrayidx43, align 8
  %indvars.iv.next18.2 = add nsw i64 %indvars.iv17, 3
  %arrayidx34.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv23, i64 %indvars.iv.next18.2
  %23 = load double, double* %arrayidx34.3, align 8
  %mul39.3 = fmul double %23, %23
  %sub44.3 = fsub double %sub44.2, %mul39.3
  store double %sub44.3, double* %arrayidx43, align 8
  %exitcond22.3 = icmp eq i64 %indvars.iv.next18.2, %wide.trip.count21
  %indvars.iv.next18.3 = add nsw i64 %indvars.iv17, 4
  br i1 %exitcond22.3, label %for.inc56.loopexit, label %for.inc45

for.inc56.loopexit:                               ; preds = %for.inc45
  br label %for.inc56

for.inc56:                                        ; preds = %for.inc56.loopexit, %for.inc45.prol.loopexit, %for.end27.for.inc56_crit_edge
  %arrayidx51.pre-phi = phi double* [ %arrayidx51.phi.trans.insert, %for.end27.for.inc56_crit_edge ], [ %arrayidx43, %for.inc45.prol.loopexit ], [ %arrayidx43, %for.inc56.loopexit ]
  %24 = phi double [ %.pre27, %for.end27.for.inc56_crit_edge ], [ %sub44.lcssa.unr, %for.inc45.prol.loopexit ], [ %sub44.3, %for.inc56.loopexit ]
  %call = call double @sqrt(double %24) #3
  store double %call, double* %arrayidx51.pre-phi, align 8
  %indvars.iv.next24 = add i64 %indvars.iv23, 1
  %cmp = icmp slt i64 %indvars.iv.next24, 2000
  %indvars.iv.next20 = add i32 %indvars.iv19, 1
  br i1 %cmp, label %for.inc56.for.body_crit_edge, label %for.end58

for.inc56.for.body_crit_edge:                     ; preds = %for.inc56
  %indvars.iv.next32 = add i2 %indvars.iv31, 1
  br label %for.body

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
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body

for.body:                                         ; preds = %for.inc10, %for.body.lr.ph
  %indvars.iv8 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next9, %for.inc10 ]
  %cmp31 = icmp sgt i64 %indvars.iv8, -1
  br i1 %cmp31, label %for.body4.lr.ph, label %for.inc10

for.body4.lr.ph:                                  ; preds = %for.body
  %3 = mul nsw i64 %indvars.iv8, 2000
  br label %for.body4

for.body4:                                        ; preds = %for.inc, %for.body4.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body4.lr.ph ], [ %indvars.iv.next, %for.inc ]
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
  %call9 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %cmp3 = icmp slt i64 %indvars.iv, %indvars.iv8
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  br i1 %cmp3, label %for.body4, label %for.inc10.loopexit

for.inc10.loopexit:                               ; preds = %for.inc
  br label %for.inc10

for.inc10:                                        ; preds = %for.inc10.loopexit, %for.body
  %indvars.iv.next9 = add i64 %indvars.iv8, 1
  %cmp = icmp slt i64 %indvars.iv.next9, 2000
  br i1 %cmp, label %for.body, label %for.end12

for.end12:                                        ; preds = %for.inc10
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
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
