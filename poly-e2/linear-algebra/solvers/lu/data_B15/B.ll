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
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
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
  %1 = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %n, [2000 x double]* %A) unnamed_addr #0 {
for.cond1.preheader.lr.ph:
  br label %for.inc.lr.ph

for.inc.lr.ph:                                    ; preds = %for.inc.lr.ph.backedge, %for.cond1.preheader.lr.ph
  %indvars.iv138 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %0, %for.inc.lr.ph.backedge ]
  %indvars.iv136 = phi i64 [ 1, %for.cond1.preheader.lr.ph ], [ %indvars.iv136.be, %for.inc.lr.ph.backedge ]
  %0 = add nuw nsw i64 %indvars.iv138, 1
  %1 = sub i64 1998, %indvars.iv138
  %2 = shl i64 %1, 3
  %3 = and i64 %2, 34359738360
  br label %for.inc

for.cond8.preheader:                              ; preds = %for.inc
  %cmp991 = icmp slt i64 %0, 2000
  br i1 %cmp991, label %for.inc23.thread, label %for.inc23

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph
  %indvars.iv120 = phi i64 [ %indvars.iv.next121, %for.inc ], [ 0, %for.inc.lr.ph ]
  %4 = sub nsw i64 0, %indvars.iv120
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 2000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 2.000000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv138, i64 %indvars.iv120
  store double %add, double* %arrayidx6, align 8
  %indvars.iv.next121 = add nuw nsw i64 %indvars.iv120, 1
  %exitcond126 = icmp eq i64 %indvars.iv.next121, %indvars.iv136
  br i1 %exitcond126, label %for.cond8.preheader, label %for.inc

for.inc23.thread:                                 ; preds = %for.cond8.preheader
  %6 = add nuw nsw i64 %3, 8
  %scevgep133 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %0
  %7 = mul nuw nsw i64 %indvars.iv138, 2000
  %scevgep134 = getelementptr double, double* %scevgep133, i64 %7
  %scevgep134135 = bitcast double* %scevgep134 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep134135, i8 0, i64 %6, i32 8, i1 false)
  %arrayidx22150 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv138, i64 %indvars.iv138
  store double 1.000000e+00, double* %arrayidx22150, align 8
  br label %for.inc.lr.ph.backedge

for.inc23:                                        ; preds = %for.cond8.preheader
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv138, i64 %indvars.iv138
  store double 1.000000e+00, double* %arrayidx22, align 8
  %exitcond149 = icmp eq i64 %0, 2000
  br i1 %exitcond149, label %for.cond30.preheader.us.preheader.new, label %for.inc.lr.ph.backedge

for.inc.lr.ph.backedge:                           ; preds = %for.inc23, %for.inc23.thread
  %indvars.iv136.be = add nuw nsw i64 %indvars.iv136, 1
  br label %for.inc.lr.ph

for.cond30.preheader.us.preheader.new:            ; preds = %for.inc23
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %for.cond30.for.inc41_crit_edge.us.3

for.cond52.preheader.us.us.preheader:             ; preds = %for.cond52.preheader.us.us.preheader.preheader, %for.cond48.for.inc75_crit_edge.us
  %indvars.iv108 = phi i64 [ %indvars.iv.next109, %for.cond48.for.inc75_crit_edge.us ], [ 0, %for.cond52.preheader.us.us.preheader.preheader ]
  br label %for.cond52.preheader.us.us.new

for.cond48.for.inc75_crit_edge.us:                ; preds = %for.cond52.for.inc72_crit_edge.us.us
  %indvars.iv.next109 = add nuw nsw i64 %indvars.iv108, 1
  %exitcond148 = icmp eq i64 %indvars.iv.next109, 2000
  br i1 %exitcond148, label %for.cond82.preheader.us.new.preheader, label %for.cond52.preheader.us.us.preheader

for.cond82.preheader.us.new.preheader:            ; preds = %for.cond48.for.inc75_crit_edge.us
  %8 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond82.preheader.us.new

for.cond52.preheader.us.us.new:                   ; preds = %for.cond52.preheader.us.us.preheader, %for.cond52.for.inc72_crit_edge.us.us
  %indvars.iv104 = phi i64 [ 0, %for.cond52.preheader.us.us.preheader ], [ %indvars.iv.next105, %for.cond52.for.inc72_crit_edge.us.us ]
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv104, i64 %indvars.iv108
  br label %for.inc69.us.us

for.cond52.for.inc72_crit_edge.us.us:             ; preds = %for.inc69.us.us
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  %exitcond147 = icmp eq i64 %indvars.iv.next105, 2000
  br i1 %exitcond147, label %for.cond48.for.inc75_crit_edge.us, label %for.cond52.preheader.us.us.new

for.inc69.us.us:                                  ; preds = %for.inc69.us.us, %for.cond52.preheader.us.us.new
  %indvars.iv100 = phi i64 [ 0, %for.cond52.preheader.us.us.new ], [ %indvars.iv.next101.1, %for.inc69.us.us ]
  %9 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv100, i64 %indvars.iv108
  %10 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %9, %10
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %35, i64 0, i64 %indvars.iv104, i64 %indvars.iv100
  %11 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %11, %mul.us.us
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %indvars.iv.next101 = or i64 %indvars.iv100, 1
  %12 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next101, i64 %indvars.iv108
  %13 = load double, double* %arrayidx63.us.us.1, align 8
  %mul.us.us.1 = fmul double %12, %13
  %arrayidx67.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %35, i64 0, i64 %indvars.iv104, i64 %indvars.iv.next101
  %14 = load double, double* %arrayidx67.us.us.1, align 8
  %add68.us.us.1 = fadd double %14, %mul.us.us.1
  store double %add68.us.us.1, double* %arrayidx67.us.us.1, align 8
  %indvars.iv.next101.1 = add nuw nsw i64 %indvars.iv100, 2
  %exitcond103.1 = icmp eq i64 %indvars.iv.next101.1, 2000
  br i1 %exitcond103.1, label %for.cond52.for.inc72_crit_edge.us.us, label %for.inc69.us.us

for.cond82.preheader.us.new:                      ; preds = %for.cond82.preheader.us.new.preheader, %for.cond82.for.inc97_crit_edge.us
  %indvars.iv96 = phi i64 [ %indvars.iv.next97, %for.cond82.for.inc97_crit_edge.us ], [ 0, %for.cond82.preheader.us.new.preheader ]
  br label %for.inc94.us

for.inc94.us:                                     ; preds = %for.inc94.us, %for.cond82.preheader.us.new
  %indvars.iv = phi i64 [ 0, %for.cond82.preheader.us.new ], [ %indvars.iv.next.3, %for.inc94.us ]
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %8, i64 0, i64 %indvars.iv96, i64 %indvars.iv
  %15 = bitcast double* %arrayidx89.us to i64*
  %16 = load i64, i64* %15, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv96, i64 %indvars.iv
  %17 = bitcast double* %arrayidx93.us to i64*
  store i64 %16, i64* %17, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %8, i64 0, i64 %indvars.iv96, i64 %indvars.iv.next
  %18 = bitcast double* %arrayidx89.us.1 to i64*
  %19 = load i64, i64* %18, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv96, i64 %indvars.iv.next
  %20 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %19, i64* %20, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %8, i64 0, i64 %indvars.iv96, i64 %indvars.iv.next.1
  %21 = bitcast double* %arrayidx89.us.2 to i64*
  %22 = load i64, i64* %21, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv96, i64 %indvars.iv.next.1
  %23 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %22, i64* %23, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %8, i64 0, i64 %indvars.iv96, i64 %indvars.iv.next.2
  %24 = bitcast double* %arrayidx89.us.3 to i64*
  %25 = load i64, i64* %24, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv96, i64 %indvars.iv.next.2
  %26 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %25, i64* %26, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond.3, label %for.cond82.for.inc97_crit_edge.us, label %for.inc94.us

for.cond82.for.inc97_crit_edge.us:                ; preds = %for.inc94.us
  %indvars.iv.next97 = add nuw nsw i64 %indvars.iv96, 1
  %exitcond = icmp eq i64 %indvars.iv.next97, 2000
  br i1 %exitcond, label %for.end99, label %for.cond82.preheader.us.new

for.end99:                                        ; preds = %for.cond82.for.inc97_crit_edge.us
  tail call void @free(i8* nonnull %call) #4
  ret void

for.cond30.for.inc41_crit_edge.us.3:              ; preds = %for.cond30.for.inc41_crit_edge.us.3, %for.cond30.preheader.us.preheader.new
  %indvars.iv116 = phi i64 [ 0, %for.cond30.preheader.us.preheader.new ], [ %indvars.iv.next117.3.1, %for.cond30.for.inc41_crit_edge.us.3 ]
  %27 = mul nuw nsw i64 %indvars.iv116, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %27
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117 = or i64 %indvars.iv116, 1
  %28 = mul nuw nsw i64 %indvars.iv.next117, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %28
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.1 = or i64 %indvars.iv116, 2
  %29 = mul nuw nsw i64 %indvars.iv.next117.1, 16000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %29
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.2 = or i64 %indvars.iv116, 3
  %30 = mul nuw nsw i64 %indvars.iv.next117.2, 16000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %30
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.3 = or i64 %indvars.iv116, 4
  %31 = mul nuw nsw i64 %indvars.iv.next117.3, 16000
  %scevgep.1153 = getelementptr i8, i8* %call, i64 %31
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1153, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.1154 = or i64 %indvars.iv116, 5
  %32 = mul nuw nsw i64 %indvars.iv.next117.1154, 16000
  %scevgep.1.1 = getelementptr i8, i8* %call, i64 %32
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.1.1 = or i64 %indvars.iv116, 6
  %33 = mul nuw nsw i64 %indvars.iv.next117.1.1, 16000
  %scevgep.2.1 = getelementptr i8, i8* %call, i64 %33
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.2.1 = or i64 %indvars.iv116, 7
  %34 = mul nuw nsw i64 %indvars.iv.next117.2.1, 16000
  %scevgep.3.1 = getelementptr i8, i8* %call, i64 %34
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.3.1 = add nsw i64 %indvars.iv116, 8
  %exitcond119.3.1 = icmp eq i64 %indvars.iv.next117.3.1, 2000
  br i1 %exitcond119.3.1, label %for.cond52.preheader.us.us.preheader.preheader, label %for.cond30.for.inc41_crit_edge.us.3

for.cond52.preheader.us.us.preheader.preheader:   ; preds = %for.cond30.for.inc41_crit_edge.us.3
  %35 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond52.preheader.us.us.preheader
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32 %n, [2000 x double]* %A) unnamed_addr #2 {
for.cond1.preheader.preheader:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc54, %for.cond1.preheader.preheader
  %indvars.iv66 = phi i64 [ 0, %for.cond1.preheader.preheader ], [ %indvars.iv.next67, %for.inc54 ]
  %cmp233 = icmp sgt i64 %indvars.iv66, 0
  br i1 %cmp233, label %for.cond4.preheader.preheader, label %for.inc54

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv66, i64 0
  br label %for.cond4.preheader

for.cond31.preheader.us.preheader:                ; preds = %for.inc25
  %xtraiter70 = and i64 %indvars.iv66, 1
  %0 = icmp eq i64 %xtraiter70, 0
  %1 = icmp eq i64 %indvars.iv66, 1
  br label %for.cond31.preheader.us

for.cond31.preheader.us:                          ; preds = %for.cond31.preheader.us.preheader, %for.cond31.for.inc51_crit_edge.us
  %indvars.iv62 = phi i64 [ %indvars.iv.next63, %for.cond31.for.inc51_crit_edge.us ], [ %indvars.iv66, %for.cond31.preheader.us.preheader ]
  %arrayidx46.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv66, i64 %indvars.iv62
  %.pre44 = load double, double* %arrayidx46.us, align 8
  br i1 %0, label %for.inc48.us.prol.loopexit, label %for.inc48.us.prol

for.inc48.us.prol:                                ; preds = %for.cond31.preheader.us
  %2 = load double, double* %arrayidx8.prol, align 8
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv62
  %3 = load double, double* %arrayidx41.us.prol, align 8
  %mul42.us.prol = fmul double %2, %3
  %sub47.us.prol = fsub double %.pre44, %mul42.us.prol
  store double %sub47.us.prol, double* %arrayidx46.us, align 8
  br label %for.inc48.us.prol.loopexit

for.inc48.us.prol.loopexit:                       ; preds = %for.inc48.us.prol, %for.cond31.preheader.us
  %indvars.iv55.unr.ph = phi i64 [ 1, %for.inc48.us.prol ], [ 0, %for.cond31.preheader.us ]
  %.unr72.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ %.pre44, %for.cond31.preheader.us ]
  br i1 %1, label %for.cond31.for.inc51_crit_edge.us, label %for.inc48.us.preheader

for.inc48.us.preheader:                           ; preds = %for.inc48.us.prol.loopexit
  br label %for.inc48.us

for.inc48.us:                                     ; preds = %for.inc48.us.preheader, %for.inc48.us
  %indvars.iv55 = phi i64 [ %indvars.iv.next56.1, %for.inc48.us ], [ %indvars.iv55.unr.ph, %for.inc48.us.preheader ]
  %4 = phi double [ %sub47.us.1, %for.inc48.us ], [ %.unr72.ph, %for.inc48.us.preheader ]
  %arrayidx37.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv66, i64 %indvars.iv55
  %5 = load double, double* %arrayidx37.us, align 8
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv55, i64 %indvars.iv62
  %6 = load double, double* %arrayidx41.us, align 8
  %mul42.us = fmul double %5, %6
  %sub47.us = fsub double %4, %mul42.us
  store double %sub47.us, double* %arrayidx46.us, align 8
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %arrayidx37.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv66, i64 %indvars.iv.next56
  %7 = load double, double* %arrayidx37.us.1, align 8
  %arrayidx41.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next56, i64 %indvars.iv62
  %8 = load double, double* %arrayidx41.us.1, align 8
  %mul42.us.1 = fmul double %7, %8
  %sub47.us.1 = fsub double %sub47.us, %mul42.us.1
  store double %sub47.us.1, double* %arrayidx46.us, align 8
  %indvars.iv.next56.1 = add nuw nsw i64 %indvars.iv55, 2
  %exitcond59.1 = icmp eq i64 %indvars.iv.next56.1, %indvars.iv66
  br i1 %exitcond59.1, label %for.cond31.for.inc51_crit_edge.us.loopexit, label %for.inc48.us

for.cond31.for.inc51_crit_edge.us.loopexit:       ; preds = %for.inc48.us
  br label %for.cond31.for.inc51_crit_edge.us

for.cond31.for.inc51_crit_edge.us:                ; preds = %for.cond31.for.inc51_crit_edge.us.loopexit, %for.inc48.us.prol.loopexit
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %exitcond = icmp eq i64 %indvars.iv.next63, 2000
  br i1 %exitcond, label %for.inc54.loopexit, label %for.cond31.preheader.us

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.inc25
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %for.inc25 ], [ 0, %for.cond4.preheader.preheader ]
  %cmp531 = icmp sgt i64 %indvars.iv48, 0
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv66, i64 %indvars.iv48
  %.pre = load double, double* %arrayidx16, align 8
  br i1 %cmp531, label %for.inc.lr.ph, label %for.inc25

for.inc.lr.ph:                                    ; preds = %for.cond4.preheader
  %xtraiter = and i64 %indvars.iv48, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.prol.loopexit, label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.lr.ph
  %9 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv48
  %10 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %9, %10
  %sub.prol = fsub double %.pre, %mul.prol
  store double %sub.prol, double* %arrayidx16, align 8
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol, %for.inc.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.prol ], [ 0, %for.inc.lr.ph ]
  %.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ %.pre, %for.inc.lr.ph ]
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ undef, %for.inc.lr.ph ]
  %11 = icmp eq i64 %indvars.iv48, 1
  br i1 %11, label %for.inc25, label %for.inc.preheader

for.inc.preheader:                                ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc.preheader, %for.inc
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.inc ], [ %indvars.iv.unr.ph, %for.inc.preheader ]
  %12 = phi double [ %sub.1, %for.inc ], [ %.unr.ph, %for.inc.preheader ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv66, i64 %indvars.iv
  %13 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv48
  %14 = load double, double* %arrayidx12, align 8
  %mul = fmul double %13, %14
  %sub = fsub double %12, %mul
  store double %sub, double* %arrayidx16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv66, i64 %indvars.iv.next
  %15 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv48
  %16 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %15, %16
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv48
  br i1 %exitcond.1, label %for.inc25.loopexit, label %for.inc

for.inc25.loopexit:                               ; preds = %for.inc
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.loopexit, %for.cond4.preheader, %for.inc.prol.loopexit
  %17 = phi double [ %sub.lcssa.unr.ph, %for.inc.prol.loopexit ], [ %.pre, %for.cond4.preheader ], [ %sub.1, %for.inc25.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv48, i64 %indvars.iv48
  %18 = load double, double* %arrayidx20, align 8
  %div = fdiv double %17, %18
  store double %div, double* %arrayidx16, align 8
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next49, %indvars.iv66
  br i1 %exitcond53, label %for.cond31.preheader.us.preheader, label %for.cond4.preheader

for.inc54.loopexit:                               ; preds = %for.cond31.for.inc51_crit_edge.us
  br label %for.inc54

for.inc54:                                        ; preds = %for.inc54.loopexit, %for.cond1.preheader
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond73 = icmp eq i64 %indvars.iv.next67, 2000
  br i1 %exitcond73, label %for.end56, label %for.cond1.preheader

for.end56:                                        ; preds = %for.inc54
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [2000 x double]* %A) unnamed_addr #0 {
for.cond2.preheader.us.preheader:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv13 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next14, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nuw nsw i64 %indvars.iv13, 2000
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %for.inc.us ]
  %4 = add nuw nsw i64 %indvars.iv, %3
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
  %arrayidx8.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv13, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond18, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond = icmp eq i64 %indvars.iv.next14, 2000
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
