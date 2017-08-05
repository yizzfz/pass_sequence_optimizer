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
entry:
  %cmp71 = icmp sgt i32 %n, 0
  br i1 %cmp71, label %for.cond1.preheader.lr.ph, label %for.end25.thread

for.end25.thread:                                 ; preds = %entry
  %call150 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %for.end99

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %conv4 = sitofp i32 %n to double
  %0 = add i32 %n, -2
  %1 = zext i32 %0 to i64
  %2 = sext i32 %n to i64
  %3 = zext i32 %n to i64
  br label %for.inc.lr.ph

for.inc.lr.ph:                                    ; preds = %for.inc23.for.inc.lr.ph_crit_edge, %for.cond1.preheader.lr.ph
  %indvars.iv138 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next139, %for.inc23.for.inc.lr.ph_crit_edge ]
  %indvars.iv136 = phi i64 [ 1, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next137, %for.inc23.for.inc.lr.ph_crit_edge ]
  %4 = add nuw nsw i64 %indvars.iv138, 1
  %5 = sub i64 %1, %indvars.iv138
  %6 = shl i64 %5, 3
  %7 = and i64 %6, 34359738360
  br label %for.inc

for.cond8.preheader:                              ; preds = %for.inc
  %indvars.iv.next139 = add nuw nsw i64 %indvars.iv138, 1
  %cmp969 = icmp slt i64 %indvars.iv.next139, %2
  br i1 %cmp969, label %for.inc23.loopexit, label %for.inc23

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph
  %indvars.iv120 = phi i64 [ 0, %for.inc.lr.ph ], [ %indvars.iv.next121, %for.inc ]
  %8 = sub nsw i64 0, %indvars.iv120
  %9 = trunc i64 %8 to i32
  %rem = srem i32 %9, %n
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, %conv4
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv138, i64 %indvars.iv120
  store double %add, double* %arrayidx6, align 8
  %indvars.iv.next121 = add nuw nsw i64 %indvars.iv120, 1
  %exitcond126 = icmp eq i64 %indvars.iv.next121, %indvars.iv136
  br i1 %exitcond126, label %for.cond8.preheader, label %for.inc

for.inc23.loopexit:                               ; preds = %for.cond8.preheader
  %10 = add nuw nsw i64 %7, 8
  %scevgep133 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %4
  %11 = mul nuw nsw i64 %indvars.iv138, 2000
  %scevgep134 = getelementptr double, double* %scevgep133, i64 %11
  %scevgep134135 = bitcast double* %scevgep134 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep134135, i8 0, i64 %10, i32 8, i1 false)
  br label %for.inc23

for.inc23:                                        ; preds = %for.cond8.preheader, %for.inc23.loopexit
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv138, i64 %indvars.iv138
  store double 1.000000e+00, double* %arrayidx22, align 8
  %exitcond149 = icmp eq i64 %indvars.iv.next139, %3
  br i1 %exitcond149, label %for.end25, label %for.inc23.for.inc.lr.ph_crit_edge

for.inc23.for.inc.lr.ph_crit_edge:                ; preds = %for.inc23
  %indvars.iv.next137 = add nuw nsw i64 %indvars.iv136, 1
  br label %for.inc.lr.ph

for.end25:                                        ; preds = %for.inc23
  %12 = icmp sgt i32 %n, 0
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br i1 %12, label %for.cond30.preheader.lr.ph, label %for.end99

for.cond30.preheader.lr.ph:                       ; preds = %for.end25
  %13 = add i32 %n, -1
  %14 = zext i32 %13 to i64
  %15 = shl nuw nsw i64 %14, 3
  %16 = add nuw nsw i64 %15, 8
  %17 = zext i32 %n to i64
  %18 = add nsw i64 %17, -1
  %xtraiter144 = and i64 %17, 3
  %lcmp.mod145 = icmp eq i64 %xtraiter144, 0
  br i1 %lcmp.mod145, label %for.cond30.preheader.us.prol.loopexit, label %for.inc41.us.prol.preheader

for.inc41.us.prol.preheader:                      ; preds = %for.cond30.preheader.lr.ph
  br label %for.inc41.us.prol

for.inc41.us.prol:                                ; preds = %for.inc41.us.prol.preheader, %for.inc41.us.prol.for.inc41.us.prol_crit_edge
  %indvars.iv116.prol = phi i64 [ %indvars.iv.next117.prol, %for.inc41.us.prol.for.inc41.us.prol_crit_edge ], [ 0, %for.inc41.us.prol.preheader ]
  %prol.iter146 = phi i64 [ %prol.iter146.sub, %for.inc41.us.prol.for.inc41.us.prol_crit_edge ], [ %xtraiter144, %for.inc41.us.prol.preheader ]
  %19 = mul nuw nsw i64 %indvars.iv116.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %call, i64 %19
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %16, i32 8, i1 false)
  %prol.iter146.sub = add nsw i64 %prol.iter146, -1
  %prol.iter146.cmp = icmp eq i64 %prol.iter146.sub, 0
  br i1 %prol.iter146.cmp, label %for.cond30.preheader.us.prol.loopexit.loopexit, label %for.inc41.us.prol.for.inc41.us.prol_crit_edge, !llvm.loop !1

for.inc41.us.prol.for.inc41.us.prol_crit_edge:    ; preds = %for.inc41.us.prol
  %indvars.iv.next117.prol = add nuw nsw i64 %indvars.iv116.prol, 1
  br label %for.inc41.us.prol

for.cond30.preheader.us.prol.loopexit.loopexit:   ; preds = %for.inc41.us.prol
  br label %for.cond30.preheader.us.prol.loopexit

for.cond30.preheader.us.prol.loopexit:            ; preds = %for.cond30.preheader.us.prol.loopexit.loopexit, %for.cond30.preheader.lr.ph
  %indvars.iv116.unr = phi i64 [ 0, %for.cond30.preheader.lr.ph ], [ %xtraiter144, %for.cond30.preheader.us.prol.loopexit.loopexit ]
  %20 = icmp ult i64 %18, 3
  br i1 %20, label %for.cond44.preheader, label %for.inc41.us.3.preheader

for.inc41.us.3.preheader:                         ; preds = %for.cond30.preheader.us.prol.loopexit
  %wide.trip.count118.3 = zext i32 %n to i64
  %21 = add nsw i64 %17, -4
  %22 = sub nsw i64 %21, %indvars.iv116.unr
  %23 = lshr i64 %22, 2
  %24 = and i64 %23, 1
  %lcmp.mod = icmp eq i64 %24, 0
  br i1 %lcmp.mod, label %for.inc41.us.3.prol.preheader, label %for.inc41.us.3.prol.loopexit

for.inc41.us.3.prol.preheader:                    ; preds = %for.inc41.us.3.preheader
  br label %for.inc41.us.3.prol

for.inc41.us.3.prol:                              ; preds = %for.inc41.us.3.prol.preheader
  %25 = mul nuw nsw i64 %indvars.iv116.unr, 16000
  %scevgep.prol159 = getelementptr i8, i8* %call, i64 %25
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol159, i8 0, i64 %16, i32 8, i1 false)
  %26 = mul nuw nsw i64 %indvars.iv116.unr, 16000
  %27 = add nuw nsw i64 %26, 16000
  %scevgep.1.prol = getelementptr i8, i8* %call, i64 %27
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.prol, i8 0, i64 %16, i32 8, i1 false)
  %28 = mul nuw nsw i64 %indvars.iv116.unr, 16000
  %29 = add nuw nsw i64 %28, 32000
  %scevgep.2.prol = getelementptr i8, i8* %call, i64 %29
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.prol, i8 0, i64 %16, i32 8, i1 false)
  %30 = mul nuw nsw i64 %indvars.iv116.unr, 16000
  %31 = add nuw nsw i64 %30, 48000
  %scevgep.3.prol = getelementptr i8, i8* %call, i64 %31
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.prol, i8 0, i64 %16, i32 8, i1 false)
  %indvars.iv.next117.3.prol = or i64 %indvars.iv116.unr, 4
  br label %for.inc41.us.3.prol.loopexit

for.inc41.us.3.prol.loopexit:                     ; preds = %for.inc41.us.3.prol, %for.inc41.us.3.preheader
  %indvars.iv116.unr160 = phi i64 [ %indvars.iv116.unr, %for.inc41.us.3.preheader ], [ %indvars.iv.next117.3.prol, %for.inc41.us.3.prol ]
  %32 = icmp eq i64 %23, 0
  br i1 %32, label %for.cond44.preheader.loopexit, label %for.inc41.us.3.preheader.new

for.inc41.us.3.preheader.new:                     ; preds = %for.inc41.us.3.prol.loopexit
  br label %for.inc41.us.3

for.cond44.preheader.loopexit.unr-lcssa:          ; preds = %for.inc41.us.3
  br label %for.cond44.preheader.loopexit

for.cond44.preheader.loopexit:                    ; preds = %for.inc41.us.3.prol.loopexit, %for.cond44.preheader.loopexit.unr-lcssa
  br label %for.cond44.preheader

for.cond44.preheader:                             ; preds = %for.cond44.preheader.loopexit, %for.cond30.preheader.us.prol.loopexit
  %33 = icmp sgt i32 %n, 0
  br i1 %33, label %for.cond48.preheader.lr.ph, label %for.end99

for.cond48.preheader.lr.ph:                       ; preds = %for.cond44.preheader
  %34 = zext i32 %n to i64
  %xtraiter142 = and i64 %34, 1
  %wide.trip.count102.1 = zext i32 %n to i64
  %35 = icmp eq i64 %xtraiter142, 0
  %36 = icmp eq i32 %n, 1
  %37 = bitcast i8* %call to [2000 x [2000 x double]]*
  %38 = bitcast i8* %call to [2000 x [2000 x double]]*
  %sunkaddr = ptrtoint [2000 x double]* %A to i64
  br label %for.cond52.preheader.us.us.preheader

for.cond52.preheader.us.us.preheader:             ; preds = %for.inc75.us, %for.cond48.preheader.lr.ph
  %indvars.iv108 = phi i64 [ 0, %for.cond48.preheader.lr.ph ], [ %indvars.iv.next109, %for.inc75.us ]
  %sunkaddr154 = shl nuw nsw i64 %indvars.iv108, 3
  %sunkaddr155 = add i64 %sunkaddr, %sunkaddr154
  %sunkaddr156 = inttoptr i64 %sunkaddr155 to double*
  br label %for.cond52.preheader.us.us

for.inc75.us:                                     ; preds = %for.inc72.us.us
  %indvars.iv.next109 = add nuw nsw i64 %indvars.iv108, 1
  %exitcond148 = icmp eq i64 %indvars.iv.next109, %34
  br i1 %exitcond148, label %for.cond78.preheader, label %for.cond52.preheader.us.us.preheader

for.cond52.preheader.us.us:                       ; preds = %for.inc72.us.us, %for.cond52.preheader.us.us.preheader
  %indvars.iv104 = phi i64 [ 0, %for.cond52.preheader.us.us.preheader ], [ %indvars.iv.next105, %for.inc72.us.us ]
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv104, i64 %indvars.iv108
  br i1 %35, label %for.inc69.us.us.prol.loopexit, label %for.inc69.us.us.prol

for.inc69.us.us.prol:                             ; preds = %for.cond52.preheader.us.us
  %39 = load double, double* %arrayidx59.us.us, align 8
  %40 = load double, double* %sunkaddr156, align 8
  %mul.us.us.prol = fmul double %39, %40
  %arrayidx67.us.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv104, i64 0
  %41 = load double, double* %arrayidx67.us.us.prol, align 8
  %add68.us.us.prol = fadd double %41, %mul.us.us.prol
  store double %add68.us.us.prol, double* %arrayidx67.us.us.prol, align 8
  br label %for.inc69.us.us.prol.loopexit

for.inc69.us.us.prol.loopexit:                    ; preds = %for.cond52.preheader.us.us, %for.inc69.us.us.prol
  %indvars.iv100.unr.ph = phi i64 [ 1, %for.inc69.us.us.prol ], [ 0, %for.cond52.preheader.us.us ]
  br i1 %36, label %for.inc72.us.us, label %for.inc69.us.us.preheader

for.inc69.us.us.preheader:                        ; preds = %for.inc69.us.us.prol.loopexit
  br label %for.inc69.us.us

for.inc72.us.us.loopexit:                         ; preds = %for.inc69.us.us
  br label %for.inc72.us.us

for.inc72.us.us:                                  ; preds = %for.inc72.us.us.loopexit, %for.inc69.us.us.prol.loopexit
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  %exitcond147 = icmp eq i64 %indvars.iv.next105, %34
  br i1 %exitcond147, label %for.inc75.us, label %for.cond52.preheader.us.us

for.inc69.us.us:                                  ; preds = %for.inc69.us.us.preheader, %for.inc69.us.us
  %indvars.iv100 = phi i64 [ %indvars.iv.next101.1, %for.inc69.us.us ], [ %indvars.iv100.unr.ph, %for.inc69.us.us.preheader ]
  %42 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv100, i64 %indvars.iv108
  %43 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %42, %43
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv104, i64 %indvars.iv100
  %44 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %44, %mul.us.us
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %indvars.iv.next101 = add nuw nsw i64 %indvars.iv100, 1
  %45 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next101, i64 %indvars.iv108
  %46 = load double, double* %arrayidx63.us.us.1, align 8
  %mul.us.us.1 = fmul double %45, %46
  %arrayidx67.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv104, i64 %indvars.iv.next101
  %47 = load double, double* %arrayidx67.us.us.1, align 8
  %add68.us.us.1 = fadd double %47, %mul.us.us.1
  store double %add68.us.us.1, double* %arrayidx67.us.us.1, align 8
  %indvars.iv.next101.1 = add nuw nsw i64 %indvars.iv100, 2
  %exitcond103.1 = icmp eq i64 %indvars.iv.next101.1, %wide.trip.count102.1
  br i1 %exitcond103.1, label %for.inc72.us.us.loopexit, label %for.inc69.us.us

for.cond78.preheader:                             ; preds = %for.inc75.us
  %48 = icmp sgt i32 %n, 0
  br i1 %48, label %for.cond82.preheader.lr.ph, label %for.end99

for.cond82.preheader.lr.ph:                       ; preds = %for.cond78.preheader
  %49 = zext i32 %n to i64
  %50 = add nsw i64 %49, -1
  %xtraiter = and i64 %49, 3
  %wide.trip.count.3 = zext i32 %n to i64
  %51 = icmp eq i64 %xtraiter, 0
  %52 = icmp ult i64 %50, 3
  %53 = bitcast i8* %call to [2000 x [2000 x double]]*
  %54 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond82.preheader.us

for.cond82.preheader.us:                          ; preds = %for.inc97.us, %for.cond82.preheader.lr.ph
  %indvars.iv96 = phi i64 [ 0, %for.cond82.preheader.lr.ph ], [ %indvars.iv.next97, %for.inc97.us ]
  br i1 %51, label %for.inc94.us.prol.loopexit, label %for.inc94.us.prol.preheader

for.inc94.us.prol.preheader:                      ; preds = %for.cond82.preheader.us
  br label %for.inc94.us.prol

for.inc94.us.prol:                                ; preds = %for.inc94.us.prol.preheader, %for.inc94.us.prol.for.inc94.us.prol_crit_edge
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc94.us.prol.for.inc94.us.prol_crit_edge ], [ 0, %for.inc94.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.inc94.us.prol.for.inc94.us.prol_crit_edge ], [ %xtraiter, %for.inc94.us.prol.preheader ]
  %arrayidx89.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %54, i64 0, i64 %indvars.iv96, i64 %indvars.iv.prol
  %55 = bitcast double* %arrayidx89.us.prol to i64*
  %56 = load i64, i64* %55, align 8
  %arrayidx93.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv96, i64 %indvars.iv.prol
  %57 = bitcast double* %arrayidx93.us.prol to i64*
  store i64 %56, i64* %57, align 8
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc94.us.prol.loopexit.loopexit, label %for.inc94.us.prol.for.inc94.us.prol_crit_edge, !llvm.loop !3

for.inc94.us.prol.for.inc94.us.prol_crit_edge:    ; preds = %for.inc94.us.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br label %for.inc94.us.prol

for.inc94.us.prol.loopexit.loopexit:              ; preds = %for.inc94.us.prol
  br label %for.inc94.us.prol.loopexit

for.inc94.us.prol.loopexit:                       ; preds = %for.inc94.us.prol.loopexit.loopexit, %for.cond82.preheader.us
  %indvars.iv.unr = phi i64 [ 0, %for.cond82.preheader.us ], [ %xtraiter, %for.inc94.us.prol.loopexit.loopexit ]
  br i1 %52, label %for.inc97.us, label %for.inc94.us.preheader

for.inc94.us.preheader:                           ; preds = %for.inc94.us.prol.loopexit
  br label %for.inc94.us

for.inc94.us:                                     ; preds = %for.inc94.us.preheader, %for.inc94.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.inc94.us ], [ %indvars.iv.unr, %for.inc94.us.preheader ]
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %53, i64 0, i64 %indvars.iv96, i64 %indvars.iv
  %58 = bitcast double* %arrayidx89.us to i64*
  %59 = load i64, i64* %58, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv96, i64 %indvars.iv
  %60 = bitcast double* %arrayidx93.us to i64*
  store i64 %59, i64* %60, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %53, i64 0, i64 %indvars.iv96, i64 %indvars.iv.next
  %61 = bitcast double* %arrayidx89.us.1 to i64*
  %62 = load i64, i64* %61, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv96, i64 %indvars.iv.next
  %63 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %62, i64* %63, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %53, i64 0, i64 %indvars.iv96, i64 %indvars.iv.next.1
  %64 = bitcast double* %arrayidx89.us.2 to i64*
  %65 = load i64, i64* %64, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv96, i64 %indvars.iv.next.1
  %66 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %65, i64* %66, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %53, i64 0, i64 %indvars.iv96, i64 %indvars.iv.next.2
  %67 = bitcast double* %arrayidx89.us.3 to i64*
  %68 = load i64, i64* %67, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv96, i64 %indvars.iv.next.2
  %69 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %68, i64* %69, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %for.inc97.us.loopexit, label %for.inc94.us

for.inc97.us.loopexit:                            ; preds = %for.inc94.us
  br label %for.inc97.us

for.inc97.us:                                     ; preds = %for.inc97.us.loopexit, %for.inc94.us.prol.loopexit
  %indvars.iv.next97 = add nuw nsw i64 %indvars.iv96, 1
  %exitcond = icmp eq i64 %indvars.iv.next97, %49
  br i1 %exitcond, label %for.end99.loopexit, label %for.cond82.preheader.us

for.end99.loopexit:                               ; preds = %for.inc97.us
  br label %for.end99

for.end99:                                        ; preds = %for.end99.loopexit, %for.cond78.preheader, %for.cond44.preheader, %for.end25, %for.end25.thread
  %call151152153 = phi i8* [ %call150, %for.end25.thread ], [ %call, %for.end25 ], [ %call, %for.cond44.preheader ], [ %call, %for.cond78.preheader ], [ %call, %for.end99.loopexit ]
  tail call void @free(i8* %call151152153) #4
  ret void

for.inc41.us.3:                                   ; preds = %for.inc41.us.3, %for.inc41.us.3.preheader.new
  %indvars.iv116 = phi i64 [ %indvars.iv116.unr160, %for.inc41.us.3.preheader.new ], [ %indvars.iv.next117.3.1, %for.inc41.us.3 ]
  %70 = mul nuw nsw i64 %indvars.iv116, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %70
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %16, i32 8, i1 false)
  %71 = mul i64 %indvars.iv116, 16000
  %72 = add i64 %71, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %72
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %16, i32 8, i1 false)
  %73 = mul i64 %indvars.iv116, 16000
  %74 = add i64 %73, 32000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %74
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %16, i32 8, i1 false)
  %75 = mul i64 %indvars.iv116, 16000
  %76 = add i64 %75, 48000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %76
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %16, i32 8, i1 false)
  %indvars.iv.next117.3 = add nuw nsw i64 %indvars.iv116, 4
  %77 = mul nuw nsw i64 %indvars.iv.next117.3, 16000
  %scevgep.1161 = getelementptr i8, i8* %call, i64 %77
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1161, i8 0, i64 %16, i32 8, i1 false)
  %78 = mul i64 %indvars.iv.next117.3, 16000
  %79 = add i64 %78, 16000
  %scevgep.1.1 = getelementptr i8, i8* %call, i64 %79
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 %16, i32 8, i1 false)
  %80 = mul i64 %indvars.iv.next117.3, 16000
  %81 = add i64 %80, 32000
  %scevgep.2.1 = getelementptr i8, i8* %call, i64 %81
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 %16, i32 8, i1 false)
  %82 = mul i64 %indvars.iv.next117.3, 16000
  %83 = add i64 %82, 48000
  %scevgep.3.1 = getelementptr i8, i8* %call, i64 %83
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 %16, i32 8, i1 false)
  %indvars.iv.next117.3.1 = add nsw i64 %indvars.iv116, 8
  %exitcond119.3.1 = icmp eq i64 %indvars.iv.next117.3.1, %wide.trip.count118.3
  br i1 %exitcond119.3.1, label %for.cond44.preheader.loopexit.unr-lcssa, label %for.inc41.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32 %n, [2000 x double]* %A) unnamed_addr #2 {
entry:
  %cmp39 = icmp sgt i32 %n, 0
  br i1 %cmp39, label %for.cond1.preheader.preheader, label %for.end56

for.cond1.preheader.preheader:                    ; preds = %entry
  %0 = zext i32 %n to i64
  %1 = zext i32 %n to i64
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc54, %for.cond1.preheader.preheader
  %indvars.iv65 = phi i64 [ 0, %for.cond1.preheader.preheader ], [ %indvars.iv.next66, %for.inc54 ]
  %cmp233 = icmp sgt i64 %indvars.iv65, 0
  br i1 %cmp233, label %for.cond4.preheader.preheader, label %for.inc54

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv65, i64 0
  br label %for.cond4.preheader

for.cond31.preheader.lr.ph:                       ; preds = %for.inc25
  %2 = icmp sgt i64 %indvars.iv65, 0
  br i1 %2, label %for.cond31.preheader.us.preheader, label %for.inc54

for.cond31.preheader.us.preheader:                ; preds = %for.cond31.preheader.lr.ph
  %xtraiter69 = and i64 %indvars.iv65, 1
  %arrayidx37.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv65, i64 0
  %3 = icmp eq i64 %xtraiter69, 0
  %4 = icmp eq i64 %indvars.iv65, 1
  br label %for.cond31.preheader.us

for.cond31.preheader.us:                          ; preds = %for.inc51.us, %for.cond31.preheader.us.preheader
  %indvars.iv61 = phi i64 [ %indvars.iv65, %for.cond31.preheader.us.preheader ], [ %indvars.iv.next62, %for.inc51.us ]
  %arrayidx46.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv65, i64 %indvars.iv61
  %.pre43 = load double, double* %arrayidx46.us, align 8
  br i1 %3, label %for.inc48.us.prol.loopexit, label %for.inc48.us.prol

for.inc48.us.prol:                                ; preds = %for.cond31.preheader.us
  %5 = load double, double* %arrayidx37.us.prol, align 8
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv61
  %6 = load double, double* %arrayidx41.us.prol, align 8
  %mul42.us.prol = fmul double %5, %6
  %sub47.us.prol = fsub double %.pre43, %mul42.us.prol
  store double %sub47.us.prol, double* %arrayidx46.us, align 8
  br label %for.inc48.us.prol.loopexit

for.inc48.us.prol.loopexit:                       ; preds = %for.cond31.preheader.us, %for.inc48.us.prol
  %indvars.iv54.unr.ph = phi i64 [ 1, %for.inc48.us.prol ], [ 0, %for.cond31.preheader.us ]
  %.unr71.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ %.pre43, %for.cond31.preheader.us ]
  br i1 %4, label %for.inc51.us, label %for.inc48.us.preheader

for.inc48.us.preheader:                           ; preds = %for.inc48.us.prol.loopexit
  br label %for.inc48.us

for.inc48.us:                                     ; preds = %for.inc48.us.preheader, %for.inc48.us
  %indvars.iv54 = phi i64 [ %indvars.iv.next55.1, %for.inc48.us ], [ %indvars.iv54.unr.ph, %for.inc48.us.preheader ]
  %7 = phi double [ %sub47.us.1, %for.inc48.us ], [ %.unr71.ph, %for.inc48.us.preheader ]
  %arrayidx37.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv65, i64 %indvars.iv54
  %8 = load double, double* %arrayidx37.us, align 8
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv54, i64 %indvars.iv61
  %9 = load double, double* %arrayidx41.us, align 8
  %mul42.us = fmul double %8, %9
  %sub47.us = fsub double %7, %mul42.us
  store double %sub47.us, double* %arrayidx46.us, align 8
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %arrayidx37.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv65, i64 %indvars.iv.next55
  %10 = load double, double* %arrayidx37.us.1, align 8
  %arrayidx41.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next55, i64 %indvars.iv61
  %11 = load double, double* %arrayidx41.us.1, align 8
  %mul42.us.1 = fmul double %10, %11
  %sub47.us.1 = fsub double %sub47.us, %mul42.us.1
  store double %sub47.us.1, double* %arrayidx46.us, align 8
  %indvars.iv.next55.1 = add nuw nsw i64 %indvars.iv54, 2
  %exitcond58.1 = icmp eq i64 %indvars.iv.next55.1, %indvars.iv65
  br i1 %exitcond58.1, label %for.inc51.us.loopexit, label %for.inc48.us

for.inc51.us.loopexit:                            ; preds = %for.inc48.us
  br label %for.inc51.us

for.inc51.us:                                     ; preds = %for.inc51.us.loopexit, %for.inc48.us.prol.loopexit
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond = icmp eq i64 %indvars.iv.next62, %0
  br i1 %exitcond, label %for.inc54.loopexit, label %for.cond31.preheader.us

for.cond4.preheader:                              ; preds = %for.inc25, %for.cond4.preheader.preheader
  %indvars.iv47 = phi i64 [ 0, %for.cond4.preheader.preheader ], [ %indvars.iv.next48, %for.inc25 ]
  %cmp531 = icmp sgt i64 %indvars.iv47, 0
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv65, i64 %indvars.iv47
  %.pre = load double, double* %arrayidx16, align 8
  br i1 %cmp531, label %for.inc.lr.ph, label %for.inc25

for.inc.lr.ph:                                    ; preds = %for.cond4.preheader
  %xtraiter = and i64 %indvars.iv47, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.prol.loopexit, label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.lr.ph
  %12 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv47
  %13 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %12, %13
  %sub.prol = fsub double %.pre, %mul.prol
  store double %sub.prol, double* %arrayidx16, align 8
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.lr.ph, %for.inc.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.prol ], [ 0, %for.inc.lr.ph ]
  %.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ %.pre, %for.inc.lr.ph ]
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ undef, %for.inc.lr.ph ]
  %14 = icmp eq i64 %indvars.iv47, 1
  br i1 %14, label %for.inc25, label %for.inc.preheader

for.inc.preheader:                                ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc.preheader, %for.inc
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.inc ], [ %indvars.iv.unr.ph, %for.inc.preheader ]
  %15 = phi double [ %sub.1, %for.inc ], [ %.unr.ph, %for.inc.preheader ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv65, i64 %indvars.iv
  %16 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv47
  %17 = load double, double* %arrayidx12, align 8
  %mul = fmul double %16, %17
  %sub = fsub double %15, %mul
  store double %sub, double* %arrayidx16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv65, i64 %indvars.iv.next
  %18 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv47
  %19 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %18, %19
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv47
  br i1 %exitcond.1, label %for.inc25.loopexit, label %for.inc

for.inc25.loopexit:                               ; preds = %for.inc
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.loopexit, %for.inc.prol.loopexit, %for.cond4.preheader
  %20 = phi double [ %.pre, %for.cond4.preheader ], [ %sub.lcssa.unr.ph, %for.inc.prol.loopexit ], [ %sub.1, %for.inc25.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv47, i64 %indvars.iv47
  %21 = load double, double* %arrayidx20, align 8
  %div = fdiv double %20, %21
  store double %div, double* %arrayidx16, align 8
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next48, %indvars.iv65
  br i1 %exitcond52, label %for.cond31.preheader.lr.ph, label %for.cond4.preheader

for.inc54.loopexit:                               ; preds = %for.inc51.us
  br label %for.inc54

for.inc54:                                        ; preds = %for.inc54.loopexit, %for.cond31.preheader.lr.ph, %for.cond1.preheader
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %exitcond72 = icmp eq i64 %indvars.iv.next66, %1
  br i1 %exitcond72, label %for.end56.loopexit, label %for.cond1.preheader

for.end56.loopexit:                               ; preds = %for.inc54
  br label %for.end56

for.end56:                                        ; preds = %for.end56.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [2000 x double]* %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %cmp10 = icmp sgt i32 %n, 0
  br i1 %cmp10, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %n to i64
  %4 = zext i32 %n to i64
  %5 = zext i32 %n to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.inc10.us, %for.cond2.preheader.us.preheader
  %indvars.iv13 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next14, %for.inc10.us ]
  %6 = mul nsw i64 %indvars.iv13, %3
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %for.inc.us ]
  %7 = add nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %rem.us = srem i32 %8, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %9) #6
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body4.us, %if.then.us
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv13, i64 %indvars.iv
  %11 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %11) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next, %4
  br i1 %exitcond18, label %for.inc10.us, label %for.body4.us

for.inc10.us:                                     ; preds = %for.inc.us
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond = icmp eq i64 %indvars.iv.next14, %5
  br i1 %exitcond, label %for.end12.loopexit, label %for.cond2.preheader.us

for.end12.loopexit:                               ; preds = %for.inc10.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %13) #6
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
