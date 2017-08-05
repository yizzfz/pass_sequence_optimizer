; ModuleID = 'A.ll'
source_filename = "cholesky.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %arraydecay = bitcast i8* %call to [2000 x double]*
  tail call void @init_array(i32 2000, [2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_start() #3
  tail call void @kernel_cholesky(i32 2000, [2000 x double]* %arraydecay)
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
  tail call void @print_array(i32 2000, [2000 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32 %n, [2000 x double]* %A) #0 {
entry:
  %cmp91 = icmp sgt i32 %n, 0
  br i1 %cmp91, label %for.cond1.preheader.lr.ph, label %for.end25.thread

for.end25.thread:                                 ; preds = %entry
  %call146 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %for.end99

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %conv4 = sitofp i32 %n to double
  %0 = add i32 %n, -2
  %1 = zext i32 %0 to i64
  %2 = sext i32 %n to i64
  %wide.trip.count142 = zext i32 %n to i64
  br label %for.inc.lr.ph

for.inc.lr.ph:                                    ; preds = %for.cond1.preheader.lr.ph, %for.inc23
  %indvars.iv140 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next141, %for.inc23 ]
  %indvars.iv138 = phi i64 [ 1, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next139, %for.inc23 ]
  %3 = mul nuw nsw i64 %indvars.iv140, 2001
  %4 = add nuw nsw i64 %3, 1
  %scevgep136 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %4
  %scevgep136137 = bitcast double* %scevgep136 to i8*
  %5 = sub i64 %1, %indvars.iv140
  %6 = shl i64 %5, 3
  %7 = and i64 %6, 34359738360
  %8 = add nuw nsw i64 %7, 8
  br label %for.inc

for.cond8.preheader:                              ; preds = %for.inc
  %indvars.iv.next141 = add nuw nsw i64 %indvars.iv140, 1
  %cmp989 = icmp slt i64 %indvars.iv.next141, %2
  br i1 %cmp989, label %for.inc16.preheader, label %for.inc23

for.inc16.preheader:                              ; preds = %for.cond8.preheader
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep136137, i8 0, i64 %8, i32 8, i1 false)
  br label %for.inc23

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph
  %indvars.iv123 = phi i64 [ %indvars.iv.next124, %for.inc ], [ 0, %for.inc.lr.ph ]
  %9 = sub nsw i64 0, %indvars.iv123
  %10 = trunc i64 %9 to i32
  %rem = srem i32 %10, %n
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, %conv4
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv140, i64 %indvars.iv123
  store double %add, double* %arrayidx6, align 8
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  %exitcond129 = icmp eq i64 %indvars.iv.next124, %indvars.iv138
  br i1 %exitcond129, label %for.cond8.preheader, label %for.inc

for.inc23:                                        ; preds = %for.inc16.preheader, %for.cond8.preheader
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv140, i64 %indvars.iv140
  store double 1.000000e+00, double* %arrayidx22, align 8
  %indvars.iv.next139 = add nuw nsw i64 %indvars.iv138, 1
  %exitcond143 = icmp eq i64 %indvars.iv.next141, %wide.trip.count142
  br i1 %exitcond143, label %for.end25, label %for.inc.lr.ph

for.end25:                                        ; preds = %for.inc23
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %11 = bitcast i8* %call to [2000 x [2000 x double]]*
  br i1 %cmp91, label %for.cond30.preheader.us.preheader, label %for.end99

for.cond30.preheader.us.preheader:                ; preds = %for.end25
  %12 = add i32 %n, -1
  %13 = zext i32 %12 to i64
  %14 = shl nuw nsw i64 %13, 3
  %15 = add nuw nsw i64 %14, 8
  %xtraiter120 = and i32 %n, 3
  %lcmp.mod121 = icmp eq i32 %xtraiter120, 0
  br i1 %lcmp.mod121, label %for.cond30.preheader.us.prol.loopexit, label %for.cond30.preheader.us.prol.preheader

for.cond30.preheader.us.prol.preheader:           ; preds = %for.cond30.preheader.us.preheader
  br label %for.cond30.preheader.us.prol

for.cond30.preheader.us.prol:                     ; preds = %for.cond30.preheader.us.prol.preheader, %for.cond30.preheader.us.prol
  %indvars.iv116.prol = phi i64 [ %indvars.iv.next117.prol, %for.cond30.preheader.us.prol ], [ 0, %for.cond30.preheader.us.prol.preheader ]
  %prol.iter122 = phi i32 [ %prol.iter122.sub, %for.cond30.preheader.us.prol ], [ %xtraiter120, %for.cond30.preheader.us.prol.preheader ]
  %16 = mul nuw nsw i64 %indvars.iv116.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %call, i64 %16
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %15, i32 8, i1 false)
  %indvars.iv.next117.prol = add nuw nsw i64 %indvars.iv116.prol, 1
  %prol.iter122.sub = add i32 %prol.iter122, -1
  %prol.iter122.cmp = icmp eq i32 %prol.iter122.sub, 0
  br i1 %prol.iter122.cmp, label %for.cond30.preheader.us.prol.loopexit.loopexit, label %for.cond30.preheader.us.prol, !llvm.loop !1

for.cond30.preheader.us.prol.loopexit.loopexit:   ; preds = %for.cond30.preheader.us.prol
  br label %for.cond30.preheader.us.prol.loopexit

for.cond30.preheader.us.prol.loopexit:            ; preds = %for.cond30.preheader.us.prol.loopexit.loopexit, %for.cond30.preheader.us.preheader
  %indvars.iv116.unr = phi i64 [ 0, %for.cond30.preheader.us.preheader ], [ %indvars.iv.next117.prol, %for.cond30.preheader.us.prol.loopexit.loopexit ]
  %17 = icmp ult i32 %12, 3
  br i1 %17, label %for.cond44.preheader, label %for.cond30.preheader.us.preheader151

for.cond30.preheader.us.preheader151:             ; preds = %for.cond30.preheader.us.prol.loopexit
  %wide.trip.count118 = zext i32 %n to i64
  %18 = add nsw i64 %wide.trip.count118, -4
  %19 = sub i64 %18, %indvars.iv116.unr
  %20 = lshr i64 %19, 2
  %21 = and i64 %20, 1
  %lcmp.mod155 = icmp eq i64 %21, 0
  br i1 %lcmp.mod155, label %for.cond30.preheader.us.prol.preheader152, label %for.cond30.preheader.us.prol.loopexit153

for.cond30.preheader.us.prol.preheader152:        ; preds = %for.cond30.preheader.us.preheader151
  br label %for.cond30.preheader.us.prol156

for.cond30.preheader.us.prol156:                  ; preds = %for.cond30.preheader.us.prol.preheader152
  %22 = mul nuw nsw i64 %indvars.iv116.unr, 16000
  %scevgep.prol158 = getelementptr i8, i8* %call, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol158, i8 0, i64 %15, i32 8, i1 false)
  %23 = mul i64 %indvars.iv116.unr, 16000
  %24 = add i64 %23, 16000
  %scevgep.1.prol = getelementptr i8, i8* %call, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.prol, i8 0, i64 %15, i32 8, i1 false)
  %25 = mul i64 %indvars.iv116.unr, 16000
  %26 = add i64 %25, 32000
  %scevgep.2.prol = getelementptr i8, i8* %call, i64 %26
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.prol, i8 0, i64 %15, i32 8, i1 false)
  %27 = mul i64 %indvars.iv116.unr, 16000
  %28 = add i64 %27, 48000
  %scevgep.3.prol = getelementptr i8, i8* %call, i64 %28
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.prol, i8 0, i64 %15, i32 8, i1 false)
  %indvars.iv.next117.3.prol = add nsw i64 %indvars.iv116.unr, 4
  br label %for.cond30.preheader.us.prol.loopexit153

for.cond30.preheader.us.prol.loopexit153:         ; preds = %for.cond30.preheader.us.prol156, %for.cond30.preheader.us.preheader151
  %indvars.iv116.unr159 = phi i64 [ %indvars.iv116.unr, %for.cond30.preheader.us.preheader151 ], [ %indvars.iv.next117.3.prol, %for.cond30.preheader.us.prol156 ]
  %29 = icmp eq i64 %20, 0
  br i1 %29, label %for.cond44.preheader.loopexit, label %for.cond30.preheader.us.preheader151.new

for.cond30.preheader.us.preheader151.new:         ; preds = %for.cond30.preheader.us.prol.loopexit153
  br label %for.cond30.preheader.us

for.cond30.preheader.us:                          ; preds = %for.cond30.preheader.us, %for.cond30.preheader.us.preheader151.new
  %indvars.iv116 = phi i64 [ %indvars.iv116.unr159, %for.cond30.preheader.us.preheader151.new ], [ %indvars.iv.next117.3.1, %for.cond30.preheader.us ]
  %30 = mul nuw nsw i64 %indvars.iv116, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %30
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %15, i32 8, i1 false)
  %31 = mul i64 %indvars.iv116, 16000
  %32 = add i64 %31, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %32
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %15, i32 8, i1 false)
  %33 = mul i64 %indvars.iv116, 16000
  %34 = add i64 %33, 32000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %34
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %15, i32 8, i1 false)
  %35 = mul i64 %indvars.iv116, 16000
  %36 = add i64 %35, 48000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %36
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %15, i32 8, i1 false)
  %indvars.iv.next117.3 = add nsw i64 %indvars.iv116, 4
  %37 = mul nuw nsw i64 %indvars.iv.next117.3, 16000
  %scevgep.1160 = getelementptr i8, i8* %call, i64 %37
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1160, i8 0, i64 %15, i32 8, i1 false)
  %38 = mul i64 %indvars.iv.next117.3, 16000
  %39 = add i64 %38, 16000
  %scevgep.1.1 = getelementptr i8, i8* %call, i64 %39
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 %15, i32 8, i1 false)
  %40 = mul i64 %indvars.iv.next117.3, 16000
  %41 = add i64 %40, 32000
  %scevgep.2.1 = getelementptr i8, i8* %call, i64 %41
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 %15, i32 8, i1 false)
  %42 = mul i64 %indvars.iv.next117.3, 16000
  %43 = add i64 %42, 48000
  %scevgep.3.1 = getelementptr i8, i8* %call, i64 %43
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 %15, i32 8, i1 false)
  %indvars.iv.next117.3.1 = add nsw i64 %indvars.iv116, 8
  %exitcond119.3.1 = icmp eq i64 %indvars.iv.next117.3.1, %wide.trip.count118
  br i1 %exitcond119.3.1, label %for.cond44.preheader.loopexit.unr-lcssa, label %for.cond30.preheader.us

for.cond44.preheader.loopexit.unr-lcssa:          ; preds = %for.cond30.preheader.us
  br label %for.cond44.preheader.loopexit

for.cond44.preheader.loopexit:                    ; preds = %for.cond30.preheader.us.prol.loopexit153, %for.cond44.preheader.loopexit.unr-lcssa
  br label %for.cond44.preheader

for.cond44.preheader:                             ; preds = %for.cond44.preheader.loopexit, %for.cond30.preheader.us.prol.loopexit
  br i1 %cmp91, label %for.cond52.preheader.us.us.preheader.preheader, label %for.end99

for.cond52.preheader.us.us.preheader.preheader:   ; preds = %for.cond44.preheader
  %xtraiter102 = and i32 %n, 1
  %lcmp.mod103 = icmp eq i32 %xtraiter102, 0
  %44 = icmp eq i32 %n, 1
  %wide.trip.count100 = zext i32 %n to i64
  br label %for.cond52.preheader.us.us.preheader

for.cond52.preheader.us.us.preheader:             ; preds = %for.cond52.preheader.us.us.preheader.preheader, %for.cond48.for.inc75_crit_edge.us
  %indvars.iv108 = phi i64 [ %indvars.iv.next109, %for.cond48.for.inc75_crit_edge.us ], [ 0, %for.cond52.preheader.us.us.preheader.preheader ]
  %arrayidx63.us.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv108
  br label %for.cond52.preheader.us.us

for.cond48.for.inc75_crit_edge.us:                ; preds = %for.cond52.for.inc72_crit_edge.us.us
  %indvars.iv.next109 = add nuw nsw i64 %indvars.iv108, 1
  %exitcond111 = icmp eq i64 %indvars.iv.next109, %wide.trip.count106.pre-phi
  br i1 %exitcond111, label %for.cond78.preheader, label %for.cond52.preheader.us.us.preheader

for.cond52.preheader.us.us:                       ; preds = %for.cond52.for.inc72_crit_edge.us.us, %for.cond52.preheader.us.us.preheader
  %indvars.iv104 = phi i64 [ 0, %for.cond52.preheader.us.us.preheader ], [ %indvars.iv.next105, %for.cond52.for.inc72_crit_edge.us.us ]
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv104, i64 %indvars.iv108
  br i1 %lcmp.mod103, label %for.inc69.us.us.prol.loopexit.unr-lcssa, label %for.inc69.us.us.prol.preheader

for.inc69.us.us.prol.preheader:                   ; preds = %for.cond52.preheader.us.us
  %45 = load double, double* %arrayidx59.us.us, align 8
  %46 = load double, double* %arrayidx63.us.us.prol, align 8
  %mul.us.us.prol = fmul double %45, %46
  %arrayidx67.us.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %11, i64 0, i64 %indvars.iv104, i64 0
  %47 = load double, double* %arrayidx67.us.us.prol, align 8
  %add68.us.us.prol = fadd double %47, %mul.us.us.prol
  store double %add68.us.us.prol, double* %arrayidx67.us.us.prol, align 8
  br label %for.inc69.us.us.prol.loopexit.unr-lcssa

for.inc69.us.us.prol.loopexit.unr-lcssa:          ; preds = %for.cond52.preheader.us.us, %for.inc69.us.us.prol.preheader
  %indvars.iv98.unr.ph = phi i64 [ 1, %for.inc69.us.us.prol.preheader ], [ 0, %for.cond52.preheader.us.us ]
  br i1 %44, label %for.cond52.for.inc72_crit_edge.us.us, label %for.inc69.us.us.preheader

for.inc69.us.us.preheader:                        ; preds = %for.inc69.us.us.prol.loopexit.unr-lcssa
  br label %for.inc69.us.us

for.cond52.for.inc72_crit_edge.us.us.loopexit:    ; preds = %for.inc69.us.us
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us:             ; preds = %for.cond52.for.inc72_crit_edge.us.us.loopexit, %for.inc69.us.us.prol.loopexit.unr-lcssa
  %wide.trip.count106.pre-phi = phi i64 [ 1, %for.inc69.us.us.prol.loopexit.unr-lcssa ], [ %wide.trip.count100, %for.cond52.for.inc72_crit_edge.us.us.loopexit ]
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  %exitcond107 = icmp eq i64 %indvars.iv.next105, %wide.trip.count106.pre-phi
  br i1 %exitcond107, label %for.cond48.for.inc75_crit_edge.us, label %for.cond52.preheader.us.us

for.inc69.us.us:                                  ; preds = %for.inc69.us.us.preheader, %for.inc69.us.us
  %indvars.iv98 = phi i64 [ %indvars.iv.next99.1, %for.inc69.us.us ], [ %indvars.iv98.unr.ph, %for.inc69.us.us.preheader ]
  %48 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv98, i64 %indvars.iv108
  %49 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %48, %49
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %11, i64 0, i64 %indvars.iv104, i64 %indvars.iv98
  %50 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %50, %mul.us.us
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %indvars.iv.next99 = add nuw nsw i64 %indvars.iv98, 1
  %51 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next99, i64 %indvars.iv108
  %52 = load double, double* %arrayidx63.us.us.1, align 8
  %mul.us.us.1 = fmul double %51, %52
  %arrayidx67.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %11, i64 0, i64 %indvars.iv104, i64 %indvars.iv.next99
  %53 = load double, double* %arrayidx67.us.us.1, align 8
  %add68.us.us.1 = fadd double %53, %mul.us.us.1
  store double %add68.us.us.1, double* %arrayidx67.us.us.1, align 8
  %indvars.iv.next99.1 = add nsw i64 %indvars.iv98, 2
  %exitcond101.1 = icmp eq i64 %indvars.iv.next99.1, %wide.trip.count100
  br i1 %exitcond101.1, label %for.cond52.for.inc72_crit_edge.us.us.loopexit, label %for.inc69.us.us

for.cond78.preheader:                             ; preds = %for.cond48.for.inc75_crit_edge.us
  br i1 %cmp91, label %for.cond82.preheader.us.preheader, label %for.end99

for.cond82.preheader.us.preheader:                ; preds = %for.cond78.preheader
  %54 = add i32 %n, -1
  %xtraiter = and i32 %n, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %55 = icmp ult i32 %54, 3
  %.pre145 = zext i32 %n to i64
  %wide.trip.count = zext i32 %n to i64
  br label %for.cond82.preheader.us

for.cond82.preheader.us:                          ; preds = %for.cond82.for.inc97_crit_edge.us, %for.cond82.preheader.us.preheader
  %indvars.iv95 = phi i64 [ 0, %for.cond82.preheader.us.preheader ], [ %indvars.iv.next96, %for.cond82.for.inc97_crit_edge.us ]
  br i1 %lcmp.mod, label %for.inc94.us.prol.loopexit, label %for.inc94.us.prol.preheader

for.inc94.us.prol.preheader:                      ; preds = %for.cond82.preheader.us
  br label %for.inc94.us.prol

for.inc94.us.prol:                                ; preds = %for.inc94.us.prol.preheader, %for.inc94.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc94.us.prol ], [ 0, %for.inc94.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.inc94.us.prol ], [ %xtraiter, %for.inc94.us.prol.preheader ]
  %arrayidx89.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %11, i64 0, i64 %indvars.iv95, i64 %indvars.iv.prol
  %56 = bitcast double* %arrayidx89.us.prol to i64*
  %57 = load i64, i64* %56, align 8
  %arrayidx93.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv95, i64 %indvars.iv.prol
  %58 = bitcast double* %arrayidx93.us.prol to i64*
  store i64 %57, i64* %58, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc94.us.prol.loopexit.loopexit, label %for.inc94.us.prol, !llvm.loop !3

for.inc94.us.prol.loopexit.loopexit:              ; preds = %for.inc94.us.prol
  br label %for.inc94.us.prol.loopexit

for.inc94.us.prol.loopexit:                       ; preds = %for.inc94.us.prol.loopexit.loopexit, %for.cond82.preheader.us
  %indvars.iv.unr = phi i64 [ 0, %for.cond82.preheader.us ], [ %indvars.iv.next.prol, %for.inc94.us.prol.loopexit.loopexit ]
  br i1 %55, label %for.cond82.for.inc97_crit_edge.us, label %for.inc94.us.preheader

for.inc94.us.preheader:                           ; preds = %for.inc94.us.prol.loopexit
  br label %for.inc94.us

for.inc94.us:                                     ; preds = %for.inc94.us.preheader, %for.inc94.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.inc94.us ], [ %indvars.iv.unr, %for.inc94.us.preheader ]
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %11, i64 0, i64 %indvars.iv95, i64 %indvars.iv
  %59 = bitcast double* %arrayidx89.us to i64*
  %60 = load i64, i64* %59, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv95, i64 %indvars.iv
  %61 = bitcast double* %arrayidx93.us to i64*
  store i64 %60, i64* %61, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %11, i64 0, i64 %indvars.iv95, i64 %indvars.iv.next
  %62 = bitcast double* %arrayidx89.us.1 to i64*
  %63 = load i64, i64* %62, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv95, i64 %indvars.iv.next
  %64 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %63, i64* %64, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %11, i64 0, i64 %indvars.iv95, i64 %indvars.iv.next.1
  %65 = bitcast double* %arrayidx89.us.2 to i64*
  %66 = load i64, i64* %65, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv95, i64 %indvars.iv.next.1
  %67 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %66, i64* %67, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %11, i64 0, i64 %indvars.iv95, i64 %indvars.iv.next.2
  %68 = bitcast double* %arrayidx89.us.3 to i64*
  %69 = load i64, i64* %68, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv95, i64 %indvars.iv.next.2
  %70 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %69, i64* %70, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count
  br i1 %exitcond.3, label %for.cond82.for.inc97_crit_edge.us.loopexit, label %for.inc94.us

for.cond82.for.inc97_crit_edge.us.loopexit:       ; preds = %for.inc94.us
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us:                ; preds = %for.cond82.for.inc97_crit_edge.us.loopexit, %for.inc94.us.prol.loopexit
  %wide.trip.count97.pre-phi = phi i64 [ %.pre145, %for.inc94.us.prol.loopexit ], [ %wide.trip.count, %for.cond82.for.inc97_crit_edge.us.loopexit ]
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95, 1
  %exitcond = icmp eq i64 %indvars.iv.next96, %wide.trip.count97.pre-phi
  br i1 %exitcond, label %for.end99.loopexit, label %for.cond82.preheader.us

for.end99.loopexit:                               ; preds = %for.cond82.for.inc97_crit_edge.us
  br label %for.end99

for.end99:                                        ; preds = %for.end99.loopexit, %for.end25, %for.end25.thread, %for.cond44.preheader, %for.cond78.preheader
  %call147148150 = phi i8* [ %call, %for.cond78.preheader ], [ %call, %for.cond44.preheader ], [ %call, %for.end25 ], [ %call146, %for.end25.thread ], [ %call, %for.end99.loopexit ]
  tail call void @free(i8* %call147148150) #3
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_cholesky(i32 %n, [2000 x double]* %A) #0 {
entry:
  %cmp39 = icmp sgt i32 %n, 0
  br i1 %cmp39, label %for.cond1.preheader.preheader, label %for.end58

for.cond1.preheader.preheader:                    ; preds = %entry
  %wide.trip.count62 = zext i32 %n to i64
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.preheader, %for.inc56
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %for.inc56 ], [ 0, %for.cond1.preheader.preheader ]
  %0 = add i64 %indvars.iv60, -2
  %1 = add i64 %indvars.iv60, 4294967295
  %cmp234 = icmp sgt i64 %indvars.iv60, 0
  br i1 %cmp234, label %for.cond4.preheader.preheader, label %for.cond28.preheader.for.inc56_crit_edge

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv60, i64 0
  br label %for.cond4.preheader

for.cond28.preheader:                             ; preds = %for.inc25
  br i1 %cmp234, label %for.inc45.lr.ph, label %for.cond28.preheader.for.inc56_crit_edge

for.cond28.preheader.for.inc56_crit_edge:         ; preds = %for.cond1.preheader, %for.cond28.preheader
  %.pre66 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv60
  br label %for.inc56

for.inc45.lr.ph:                                  ; preds = %for.cond28.preheader
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv60
  %xtraiter5667 = and i64 %indvars.iv60, 1
  %lcmp.mod57 = icmp eq i64 %xtraiter5667, 0
  br i1 %lcmp.mod57, label %for.inc45.prol.loopexit.unr-lcssa, label %for.inc45.prol.preheader

for.inc45.prol.preheader:                         ; preds = %for.inc45.lr.ph
  %arrayidx34.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv60, i64 0
  %2 = load double, double* %arrayidx34.prol, align 8
  %mul39.prol = fmul double %2, %2
  %3 = load double, double* %arrayidx43, align 8
  %sub44.prol = fsub double %3, %mul39.prol
  store double %sub44.prol, double* %arrayidx43, align 8
  br label %for.inc45.prol.loopexit.unr-lcssa

for.inc45.prol.loopexit.unr-lcssa:                ; preds = %for.inc45.lr.ph, %for.inc45.prol.preheader
  %indvars.iv51.unr.ph = phi i64 [ 1, %for.inc45.prol.preheader ], [ 0, %for.inc45.lr.ph ]
  %4 = trunc i64 %1 to i32
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %for.inc56, label %for.inc45.lr.ph.new

for.inc45.lr.ph.new:                              ; preds = %for.inc45.prol.loopexit.unr-lcssa
  %.pre64 = load double, double* %arrayidx43, align 8
  %6 = sub i64 %0, %indvars.iv51.unr.ph
  %7 = lshr i64 %6, 1
  %8 = and i64 %7, 1
  %lcmp.mod70 = icmp eq i64 %8, 0
  br i1 %lcmp.mod70, label %for.inc45.prol.preheader69, label %for.inc45.prol.loopexit.unr-lcssa74

for.inc45.prol.preheader69:                       ; preds = %for.inc45.lr.ph.new
  br label %for.inc45.prol

for.inc45.prol:                                   ; preds = %for.inc45.prol.preheader69
  %arrayidx34.prol71 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv51.unr.ph
  %9 = load double, double* %arrayidx34.prol71, align 8
  %mul39.prol72 = fmul double %9, %9
  %sub44.prol73 = fsub double %.pre64, %mul39.prol72
  store double %sub44.prol73, double* %arrayidx43, align 8
  %indvars.iv.next52.prol = add nuw nsw i64 %indvars.iv51.unr.ph, 1
  %arrayidx34.1.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv.next52.prol
  %10 = load double, double* %arrayidx34.1.prol, align 8
  %mul39.1.prol = fmul double %10, %10
  %sub44.1.prol = fsub double %sub44.prol73, %mul39.1.prol
  store double %sub44.1.prol, double* %arrayidx43, align 8
  %indvars.iv.next52.1.prol = or i64 %indvars.iv51.unr.ph, 2
  br label %for.inc45.prol.loopexit.unr-lcssa74

for.inc45.prol.loopexit.unr-lcssa74:              ; preds = %for.inc45.lr.ph.new, %for.inc45.prol
  %.unr.ph = phi double [ %sub44.1.prol, %for.inc45.prol ], [ %.pre64, %for.inc45.lr.ph.new ]
  %indvars.iv51.unr.ph75 = phi i64 [ %indvars.iv.next52.1.prol, %for.inc45.prol ], [ %indvars.iv51.unr.ph, %for.inc45.lr.ph.new ]
  br label %for.inc45.prol.loopexit

for.inc45.prol.loopexit:                          ; preds = %for.inc45.prol.loopexit.unr-lcssa74
  %11 = icmp eq i64 %7, 0
  br i1 %11, label %for.inc56.loopexit, label %for.inc45.lr.ph.new.new

for.inc45.lr.ph.new.new:                          ; preds = %for.inc45.prol.loopexit
  br label %for.inc45

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.inc25
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %for.inc25 ], [ 0, %for.cond4.preheader.preheader ]
  %12 = add i64 %indvars.iv46, 4294967295
  %cmp532 = icmp sgt i64 %indvars.iv46, 0
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv46
  br i1 %cmp532, label %for.inc.lr.ph, label %for.inc25

for.inc.lr.ph:                                    ; preds = %for.cond4.preheader
  %xtraiter68 = and i64 %indvars.iv46, 1
  %lcmp.mod = icmp eq i64 %xtraiter68, 0
  br i1 %lcmp.mod, label %for.inc.prol.loopexit.unr-lcssa, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.lr.ph
  %13 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 0
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
  br i1 %17, label %for.inc25, label %for.inc.lr.ph.new

for.inc.lr.ph.new:                                ; preds = %for.inc.prol.loopexit.unr-lcssa
  %.pre = load double, double* %arrayidx16, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph.new
  %18 = phi double [ %.pre, %for.inc.lr.ph.new ], [ %sub.1, %for.inc ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.inc.lr.ph.new ], [ %indvars.iv.next.1, %for.inc ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv
  %19 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv
  %20 = load double, double* %arrayidx12, align 8
  %mul = fmul double %19, %20
  %sub = fsub double %18, %mul
  store double %sub, double* %arrayidx16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv.next
  %21 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv.next
  %22 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %21, %22
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv46
  br i1 %exitcond.1, label %for.inc25.loopexit, label %for.inc

for.inc25.loopexit:                               ; preds = %for.inc
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.loopexit, %for.cond4.preheader, %for.inc.prol.loopexit.unr-lcssa
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv46
  %23 = load double, double* %arrayidx20, align 8
  %24 = load double, double* %arrayidx16, align 8
  %div = fdiv double %24, %23
  store double %div, double* %arrayidx16, align 8
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond = icmp eq i64 %indvars.iv.next47, %indvars.iv60
  br i1 %exitcond, label %for.cond28.preheader, label %for.cond4.preheader

for.inc45:                                        ; preds = %for.inc45, %for.inc45.lr.ph.new.new
  %25 = phi double [ %.unr.ph, %for.inc45.lr.ph.new.new ], [ %sub44.1.1, %for.inc45 ]
  %indvars.iv51 = phi i64 [ %indvars.iv51.unr.ph75, %for.inc45.lr.ph.new.new ], [ %indvars.iv.next52.1.1, %for.inc45 ]
  %arrayidx34 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv51
  %26 = load double, double* %arrayidx34, align 8
  %mul39 = fmul double %26, %26
  %sub44 = fsub double %25, %mul39
  store double %sub44, double* %arrayidx43, align 8
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %arrayidx34.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv.next52
  %27 = load double, double* %arrayidx34.1, align 8
  %mul39.1 = fmul double %27, %27
  %sub44.1 = fsub double %sub44, %mul39.1
  store double %sub44.1, double* %arrayidx43, align 8
  %indvars.iv.next52.1 = add nsw i64 %indvars.iv51, 2
  %arrayidx34.176 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv.next52.1
  %28 = load double, double* %arrayidx34.176, align 8
  %mul39.177 = fmul double %28, %28
  %sub44.178 = fsub double %sub44.1, %mul39.177
  store double %sub44.178, double* %arrayidx43, align 8
  %indvars.iv.next52.179 = add nsw i64 %indvars.iv51, 3
  %arrayidx34.1.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv.next52.179
  %29 = load double, double* %arrayidx34.1.1, align 8
  %mul39.1.1 = fmul double %29, %29
  %sub44.1.1 = fsub double %sub44.178, %mul39.1.1
  store double %sub44.1.1, double* %arrayidx43, align 8
  %indvars.iv.next52.1.1 = add nsw i64 %indvars.iv51, 4
  %exitcond55.1.1 = icmp eq i64 %indvars.iv.next52.1.1, %indvars.iv60
  br i1 %exitcond55.1.1, label %for.inc56.loopexit.unr-lcssa, label %for.inc45

for.inc56.loopexit.unr-lcssa:                     ; preds = %for.inc45
  br label %for.inc56.loopexit

for.inc56.loopexit:                               ; preds = %for.inc45.prol.loopexit, %for.inc56.loopexit.unr-lcssa
  br label %for.inc56

for.inc56:                                        ; preds = %for.inc56.loopexit, %for.inc45.prol.loopexit.unr-lcssa, %for.cond28.preheader.for.inc56_crit_edge
  %arrayidx51.pre-phi = phi double* [ %.pre66, %for.cond28.preheader.for.inc56_crit_edge ], [ %arrayidx43, %for.inc45.prol.loopexit.unr-lcssa ], [ %arrayidx43, %for.inc56.loopexit ]
  %30 = load double, double* %arrayidx51.pre-phi, align 8
  %call = tail call double @sqrt(double %30) #3
  store double %call, double* %arrayidx51.pre-phi, align 8
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond63 = icmp eq i64 %indvars.iv.next61, %wide.trip.count62
  br i1 %exitcond63, label %for.end58.loopexit, label %for.cond1.preheader

for.end58.loopexit:                               ; preds = %for.inc56
  br label %for.end58

for.end58:                                        ; preds = %for.end58.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32 %n, [2000 x double]* %A) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %cmp10 = icmp sgt i32 %n, 0
  br i1 %cmp10, label %for.cond2.preheader.preheader, label %for.end12

for.cond2.preheader.preheader:                    ; preds = %entry
  %3 = sext i32 %n to i64
  %wide.trip.count21 = zext i32 %n to i64
  br label %for.body4.lr.ph

for.body4.lr.ph:                                  ; preds = %for.cond2.preheader.preheader, %for.inc10
  %indvars.iv18 = phi i64 [ 0, %for.cond2.preheader.preheader ], [ %indvars.iv.next19, %for.inc10 ]
  %indvars.iv16 = phi i64 [ 1, %for.cond2.preheader.preheader ], [ %indvars.iv.next17, %for.inc10 ]
  %4 = mul nsw i64 %indvars.iv18, %3
  br label %for.body4

for.body4:                                        ; preds = %for.inc, %for.body4.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %for.body4.lr.ph ]
  %5 = add nsw i64 %indvars.iv, %4
  %6 = trunc i64 %5 to i32
  %rem = srem i32 %6, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body4
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %7) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body4, %if.then
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv18, i64 %indvars.iv
  %9 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %indvars.iv16
  br i1 %exitcond, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %for.inc
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next19, %wide.trip.count21
  br i1 %exitcond22, label %for.end12.loopexit, label %for.body4.lr.ph

for.end12.loopexit:                               ; preds = %for.inc10
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %11) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind
declare double @sqrt(double) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #3

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
!3 = distinct !{!3, !2}
