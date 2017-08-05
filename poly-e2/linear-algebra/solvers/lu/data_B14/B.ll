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
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %n, [2000 x double]* %A) unnamed_addr #0 {
entry:
  %cmp73 = icmp sgt i32 %n, 0
  br i1 %cmp73, label %for.cond1.preheader.lr.ph, label %for.end25.thread

for.end25.thread:                                 ; preds = %entry
  %call130 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %for.end99

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %conv4 = sitofp i32 %n to double
  %0 = add i32 %n, -2
  %1 = zext i32 %0 to i64
  %2 = sext i32 %n to i64
  %3 = zext i32 %n to i64
  br label %for.body3.lr.ph

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader.lr.ph, %for.end18
  %indvars.iv118 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next119, %for.end18 ]
  %indvars.iv116 = phi i64 [ 1, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next117, %for.end18 ]
  %4 = sub i64 %1, %indvars.iv118
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.body3.lr.ph
  %indvars.iv100 = phi i64 [ %indvars.iv.next101, %for.body3 ], [ 0, %for.body3.lr.ph ]
  %5 = sub nsw i64 0, %indvars.iv100
  %6 = trunc i64 %5 to i32
  %rem = srem i32 %6, %n
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, %conv4
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv118, i64 %indvars.iv100
  store double %add, double* %arrayidx6, align 8
  %indvars.iv.next101 = add nuw nsw i64 %indvars.iv100, 1
  %exitcond106 = icmp eq i64 %indvars.iv.next101, %indvars.iv116
  br i1 %exitcond106, label %for.end, label %for.body3

for.end:                                          ; preds = %for.body3
  %indvars.iv.next119 = add nuw nsw i64 %indvars.iv118, 1
  %cmp971 = icmp slt i64 %indvars.iv.next119, %2
  br i1 %cmp971, label %for.end18.loopexit, label %for.end18

for.end18.loopexit:                               ; preds = %for.end
  %7 = shl i64 %4, 3
  %8 = and i64 %7, 34359738360
  %9 = add nuw nsw i64 %8, 8
  %scevgep113 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv.next119
  %10 = mul nuw nsw i64 %indvars.iv118, 2000
  %scevgep114 = getelementptr double, double* %scevgep113, i64 %10
  %scevgep114115 = bitcast double* %scevgep114 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep114115, i8 0, i64 %9, i32 8, i1 false)
  br label %for.end18

for.end18:                                        ; preds = %for.end18.loopexit, %for.end
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv118, i64 %indvars.iv118
  store double 1.000000e+00, double* %arrayidx22, align 8
  %indvars.iv.next117 = add nuw nsw i64 %indvars.iv116, 1
  %exitcond129 = icmp eq i64 %indvars.iv.next119, %3
  br i1 %exitcond129, label %for.end25, label %for.body3.lr.ph

for.end25:                                        ; preds = %for.end18
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %11 = add i32 %n, -1
  %12 = zext i32 %11 to i64
  %13 = shl nuw nsw i64 %12, 3
  %14 = add nuw nsw i64 %13, 8
  %15 = add nsw i64 %3, -1
  %xtraiter124 = and i64 %3, 3
  %lcmp.mod125 = icmp eq i64 %xtraiter124, 0
  br i1 %lcmp.mod125, label %for.cond30.preheader.prol.loopexit, label %for.inc41.prol.preheader

for.inc41.prol.preheader:                         ; preds = %for.end25
  br label %for.inc41.prol

for.inc41.prol:                                   ; preds = %for.inc41.prol.preheader, %for.inc41.prol
  %indvars.iv96.prol = phi i64 [ %indvars.iv.next97.prol, %for.inc41.prol ], [ 0, %for.inc41.prol.preheader ]
  %prol.iter126 = phi i64 [ %prol.iter126.sub, %for.inc41.prol ], [ %xtraiter124, %for.inc41.prol.preheader ]
  %16 = mul nuw nsw i64 %indvars.iv96.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %call, i64 %16
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %14, i32 8, i1 false)
  %indvars.iv.next97.prol = add nuw nsw i64 %indvars.iv96.prol, 1
  %prol.iter126.sub = add nsw i64 %prol.iter126, -1
  %prol.iter126.cmp = icmp eq i64 %prol.iter126.sub, 0
  br i1 %prol.iter126.cmp, label %for.cond30.preheader.prol.loopexit.loopexit, label %for.inc41.prol, !llvm.loop !1

for.cond30.preheader.prol.loopexit.loopexit:      ; preds = %for.inc41.prol
  br label %for.cond30.preheader.prol.loopexit

for.cond30.preheader.prol.loopexit:               ; preds = %for.cond30.preheader.prol.loopexit.loopexit, %for.end25
  %indvars.iv96.unr = phi i64 [ 0, %for.end25 ], [ %xtraiter124, %for.cond30.preheader.prol.loopexit.loopexit ]
  %17 = icmp ult i64 %15, 3
  br i1 %17, label %for.cond48.preheader.preheader, label %for.inc41.3.preheader

for.inc41.3.preheader:                            ; preds = %for.cond30.preheader.prol.loopexit
  %18 = add nsw i64 %3, -4
  %19 = sub nsw i64 %18, %indvars.iv96.unr
  %20 = lshr i64 %19, 2
  %21 = and i64 %20, 1
  %lcmp.mod = icmp eq i64 %21, 0
  br i1 %lcmp.mod, label %for.inc41.3.prol.preheader, label %for.inc41.3.prol.loopexit

for.inc41.3.prol.preheader:                       ; preds = %for.inc41.3.preheader
  br label %for.inc41.3.prol

for.inc41.3.prol:                                 ; preds = %for.inc41.3.prol.preheader
  %22 = mul nuw nsw i64 %indvars.iv96.unr, 16000
  %scevgep.prol139 = getelementptr i8, i8* %call, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol139, i8 0, i64 %14, i32 8, i1 false)
  %23 = add nuw nsw i64 %22, 16000
  %scevgep.1.prol = getelementptr i8, i8* %call, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.prol, i8 0, i64 %14, i32 8, i1 false)
  %24 = add nuw nsw i64 %22, 32000
  %scevgep.2.prol = getelementptr i8, i8* %call, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.prol, i8 0, i64 %14, i32 8, i1 false)
  %25 = add nuw nsw i64 %22, 48000
  %scevgep.3.prol = getelementptr i8, i8* %call, i64 %25
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.prol, i8 0, i64 %14, i32 8, i1 false)
  %indvars.iv.next97.3.prol = or i64 %indvars.iv96.unr, 4
  br label %for.inc41.3.prol.loopexit

for.inc41.3.prol.loopexit:                        ; preds = %for.inc41.3.prol, %for.inc41.3.preheader
  %indvars.iv96.unr140 = phi i64 [ %indvars.iv96.unr, %for.inc41.3.preheader ], [ %indvars.iv.next97.3.prol, %for.inc41.3.prol ]
  %26 = icmp eq i64 %20, 0
  br i1 %26, label %for.cond48.preheader.preheader.loopexit, label %for.inc41.3.preheader.new

for.inc41.3.preheader.new:                        ; preds = %for.inc41.3.prol.loopexit
  br label %for.inc41.3

for.cond48.preheader.preheader.loopexit.unr-lcssa: ; preds = %for.inc41.3
  br label %for.cond48.preheader.preheader.loopexit

for.cond48.preheader.preheader.loopexit:          ; preds = %for.inc41.3.prol.loopexit, %for.cond48.preheader.preheader.loopexit.unr-lcssa
  br label %for.cond48.preheader.preheader

for.cond48.preheader.preheader:                   ; preds = %for.cond48.preheader.preheader.loopexit, %for.cond30.preheader.prol.loopexit
  %xtraiter122 = and i64 %3, 1
  %27 = icmp eq i64 %xtraiter122, 0
  %28 = icmp eq i32 %n, 1
  %29 = bitcast i8* %call to [2000 x [2000 x double]]*
  %30 = bitcast i8* %call to [2000 x [2000 x double]]*
  %sunkaddr = ptrtoint [2000 x double]* %A to i64
  br label %for.cond48.preheader

for.cond48.preheader:                             ; preds = %for.inc75, %for.cond48.preheader.preheader
  %indvars.iv88 = phi i64 [ 0, %for.cond48.preheader.preheader ], [ %indvars.iv.next89, %for.inc75 ]
  %sunkaddr135 = shl nuw nsw i64 %indvars.iv88, 3
  %sunkaddr136 = add i64 %sunkaddr, %sunkaddr135
  %sunkaddr137 = inttoptr i64 %sunkaddr136 to double*
  br label %for.cond52.preheader

for.cond52.preheader:                             ; preds = %for.inc72, %for.cond48.preheader
  %indvars.iv84 = phi i64 [ 0, %for.cond48.preheader ], [ %indvars.iv.next85, %for.inc72 ]
  %arrayidx59 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv84, i64 %indvars.iv88
  br i1 %27, label %for.body55.prol.loopexit, label %for.body55.prol

for.body55.prol:                                  ; preds = %for.cond52.preheader
  %31 = load double, double* %arrayidx59, align 8
  %32 = load double, double* %sunkaddr137, align 8
  %mul.prol = fmul double %31, %32
  %arrayidx67.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %30, i64 0, i64 %indvars.iv84, i64 0
  %33 = load double, double* %arrayidx67.prol, align 8
  %add68.prol = fadd double %33, %mul.prol
  store double %add68.prol, double* %arrayidx67.prol, align 8
  br label %for.body55.prol.loopexit

for.body55.prol.loopexit:                         ; preds = %for.body55.prol, %for.cond52.preheader
  %indvars.iv80.unr.ph = phi i64 [ 1, %for.body55.prol ], [ 0, %for.cond52.preheader ]
  br i1 %28, label %for.inc72, label %for.body55.preheader

for.body55.preheader:                             ; preds = %for.body55.prol.loopexit
  br label %for.body55

for.body55:                                       ; preds = %for.body55.preheader, %for.body55
  %indvars.iv80 = phi i64 [ %indvars.iv.next81.1, %for.body55 ], [ %indvars.iv80.unr.ph, %for.body55.preheader ]
  %34 = load double, double* %arrayidx59, align 8
  %arrayidx63 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv80, i64 %indvars.iv88
  %35 = load double, double* %arrayidx63, align 8
  %mul = fmul double %34, %35
  %arrayidx67 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %29, i64 0, i64 %indvars.iv84, i64 %indvars.iv80
  %36 = load double, double* %arrayidx67, align 8
  %add68 = fadd double %36, %mul
  store double %add68, double* %arrayidx67, align 8
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  %37 = load double, double* %arrayidx59, align 8
  %arrayidx63.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next81, i64 %indvars.iv88
  %38 = load double, double* %arrayidx63.1, align 8
  %mul.1 = fmul double %37, %38
  %arrayidx67.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %29, i64 0, i64 %indvars.iv84, i64 %indvars.iv.next81
  %39 = load double, double* %arrayidx67.1, align 8
  %add68.1 = fadd double %39, %mul.1
  store double %add68.1, double* %arrayidx67.1, align 8
  %indvars.iv.next81.1 = add nuw nsw i64 %indvars.iv80, 2
  %exitcond83.1 = icmp eq i64 %indvars.iv.next81.1, %3
  br i1 %exitcond83.1, label %for.inc72.loopexit, label %for.body55

for.inc72.loopexit:                               ; preds = %for.body55
  br label %for.inc72

for.inc72:                                        ; preds = %for.inc72.loopexit, %for.body55.prol.loopexit
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %exitcond127 = icmp eq i64 %indvars.iv.next85, %3
  br i1 %exitcond127, label %for.inc75, label %for.cond52.preheader

for.inc75:                                        ; preds = %for.inc72
  %indvars.iv.next89 = add nuw nsw i64 %indvars.iv88, 1
  %exitcond128 = icmp eq i64 %indvars.iv.next89, %3
  br i1 %exitcond128, label %for.cond82.preheader.preheader, label %for.cond48.preheader

for.cond82.preheader.preheader:                   ; preds = %for.inc75
  %40 = bitcast i8* %call to [2000 x [2000 x double]]*
  %41 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond82.preheader

for.cond82.preheader:                             ; preds = %for.cond82.preheader.preheader, %for.inc97
  %indvars.iv76 = phi i64 [ %indvars.iv.next77, %for.inc97 ], [ 0, %for.cond82.preheader.preheader ]
  br i1 %lcmp.mod125, label %for.body85.prol.loopexit, label %for.body85.prol.preheader

for.body85.prol.preheader:                        ; preds = %for.cond82.preheader
  br label %for.body85.prol

for.body85.prol:                                  ; preds = %for.body85.prol.preheader, %for.body85.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body85.prol ], [ 0, %for.body85.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body85.prol ], [ %xtraiter124, %for.body85.prol.preheader ]
  %arrayidx89.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %41, i64 0, i64 %indvars.iv76, i64 %indvars.iv.prol
  %42 = bitcast double* %arrayidx89.prol to i64*
  %43 = load i64, i64* %42, align 8
  %arrayidx93.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv76, i64 %indvars.iv.prol
  %44 = bitcast double* %arrayidx93.prol to i64*
  store i64 %43, i64* %44, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body85.prol.loopexit.loopexit, label %for.body85.prol, !llvm.loop !3

for.body85.prol.loopexit.loopexit:                ; preds = %for.body85.prol
  br label %for.body85.prol.loopexit

for.body85.prol.loopexit:                         ; preds = %for.body85.prol.loopexit.loopexit, %for.cond82.preheader
  %indvars.iv.unr = phi i64 [ 0, %for.cond82.preheader ], [ %xtraiter124, %for.body85.prol.loopexit.loopexit ]
  br i1 %17, label %for.inc97, label %for.body85.preheader

for.body85.preheader:                             ; preds = %for.body85.prol.loopexit
  br label %for.body85

for.body85:                                       ; preds = %for.body85.preheader, %for.body85
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body85 ], [ %indvars.iv.unr, %for.body85.preheader ]
  %arrayidx89 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv76, i64 %indvars.iv
  %45 = bitcast double* %arrayidx89 to i64*
  %46 = load i64, i64* %45, align 8
  %arrayidx93 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv76, i64 %indvars.iv
  %47 = bitcast double* %arrayidx93 to i64*
  store i64 %46, i64* %47, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx89.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv76, i64 %indvars.iv.next
  %48 = bitcast double* %arrayidx89.1 to i64*
  %49 = load i64, i64* %48, align 8
  %arrayidx93.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv76, i64 %indvars.iv.next
  %50 = bitcast double* %arrayidx93.1 to i64*
  store i64 %49, i64* %50, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx89.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv76, i64 %indvars.iv.next.1
  %51 = bitcast double* %arrayidx89.2 to i64*
  %52 = load i64, i64* %51, align 8
  %arrayidx93.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv76, i64 %indvars.iv.next.1
  %53 = bitcast double* %arrayidx93.2 to i64*
  store i64 %52, i64* %53, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx89.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv76, i64 %indvars.iv.next.2
  %54 = bitcast double* %arrayidx89.3 to i64*
  %55 = load i64, i64* %54, align 8
  %arrayidx93.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv76, i64 %indvars.iv.next.2
  %56 = bitcast double* %arrayidx93.3 to i64*
  store i64 %55, i64* %56, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %3
  br i1 %exitcond.3, label %for.inc97.loopexit, label %for.body85

for.inc97.loopexit:                               ; preds = %for.body85
  br label %for.inc97

for.inc97:                                        ; preds = %for.inc97.loopexit, %for.body85.prol.loopexit
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1
  %exitcond = icmp eq i64 %indvars.iv.next77, %3
  br i1 %exitcond, label %for.end99.loopexit, label %for.cond82.preheader

for.end99.loopexit:                               ; preds = %for.inc97
  br label %for.end99

for.end99:                                        ; preds = %for.end99.loopexit, %for.end25.thread
  %call131132134 = phi i8* [ %call130, %for.end25.thread ], [ %call, %for.end99.loopexit ]
  tail call void @free(i8* %call131132134) #4
  ret void

for.inc41.3:                                      ; preds = %for.inc41.3, %for.inc41.3.preheader.new
  %indvars.iv96 = phi i64 [ %indvars.iv96.unr140, %for.inc41.3.preheader.new ], [ %indvars.iv.next97.3.1, %for.inc41.3 ]
  %57 = mul i64 %indvars.iv96, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %57
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %14, i32 8, i1 false)
  %58 = add i64 %57, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %58
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %14, i32 8, i1 false)
  %59 = add i64 %57, 32000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %59
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %14, i32 8, i1 false)
  %60 = add i64 %57, 48000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %60
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %14, i32 8, i1 false)
  %61 = mul i64 %indvars.iv96, 16000
  %62 = add i64 %61, 64000
  %scevgep.1141 = getelementptr i8, i8* %call, i64 %62
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1141, i8 0, i64 %14, i32 8, i1 false)
  %63 = add i64 %61, 80000
  %scevgep.1.1 = getelementptr i8, i8* %call, i64 %63
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 %14, i32 8, i1 false)
  %64 = add i64 %61, 96000
  %scevgep.2.1 = getelementptr i8, i8* %call, i64 %64
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 %14, i32 8, i1 false)
  %65 = add i64 %61, 112000
  %scevgep.3.1 = getelementptr i8, i8* %call, i64 %65
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 %14, i32 8, i1 false)
  %indvars.iv.next97.3.1 = add nsw i64 %indvars.iv96, 8
  %exitcond99.3.1 = icmp eq i64 %indvars.iv.next97.3.1, %3
  br i1 %exitcond99.3.1, label %for.cond48.preheader.preheader.loopexit.unr-lcssa, label %for.inc41.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32 %n, [2000 x double]* %A) unnamed_addr #2 {
entry:
  %cmp44 = icmp sgt i32 %n, 0
  br i1 %cmp44, label %for.cond1.preheader.preheader, label %for.end56

for.cond1.preheader.preheader:                    ; preds = %entry
  %0 = zext i32 %n to i64
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc54, %for.cond1.preheader.preheader
  %indvars.iv69 = phi i64 [ 0, %for.cond1.preheader.preheader ], [ %indvars.iv.next70, %for.inc54 ]
  %cmp238 = icmp sgt i64 %indvars.iv69, 0
  br i1 %cmp238, label %for.cond4.preheader.preheader, label %for.inc54

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv69, i64 0
  br label %for.cond4.preheader

for.cond31.preheader.us.preheader:                ; preds = %for.end
  %xtraiter73 = and i64 %indvars.iv69, 1
  %1 = icmp eq i64 %xtraiter73, 0
  %2 = icmp eq i64 %indvars.iv69, 1
  br label %for.cond31.preheader.us

for.cond31.preheader.us:                          ; preds = %for.cond31.preheader.us.preheader, %for.cond31.for.inc51_crit_edge.us
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %for.cond31.for.inc51_crit_edge.us ], [ %indvars.iv69, %for.cond31.preheader.us.preheader ]
  %arrayidx46.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv69, i64 %indvars.iv65
  %.pre47 = load double, double* %arrayidx46.us, align 8
  br i1 %1, label %for.body33.us.prol.loopexit, label %for.body33.us.prol

for.body33.us.prol:                               ; preds = %for.cond31.preheader.us
  %3 = load double, double* %arrayidx8.prol, align 8
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv65
  %4 = load double, double* %arrayidx41.us.prol, align 8
  %mul42.us.prol = fmul double %3, %4
  %sub47.us.prol = fsub double %.pre47, %mul42.us.prol
  store double %sub47.us.prol, double* %arrayidx46.us, align 8
  br label %for.body33.us.prol.loopexit

for.body33.us.prol.loopexit:                      ; preds = %for.body33.us.prol, %for.cond31.preheader.us
  %indvars.iv58.unr.ph = phi i64 [ 1, %for.body33.us.prol ], [ 0, %for.cond31.preheader.us ]
  %.unr75.ph = phi double [ %sub47.us.prol, %for.body33.us.prol ], [ %.pre47, %for.cond31.preheader.us ]
  br i1 %2, label %for.cond31.for.inc51_crit_edge.us, label %for.body33.us.preheader

for.body33.us.preheader:                          ; preds = %for.body33.us.prol.loopexit
  br label %for.body33.us

for.body33.us:                                    ; preds = %for.body33.us.preheader, %for.body33.us
  %indvars.iv58 = phi i64 [ %indvars.iv.next59.1, %for.body33.us ], [ %indvars.iv58.unr.ph, %for.body33.us.preheader ]
  %5 = phi double [ %sub47.us.1, %for.body33.us ], [ %.unr75.ph, %for.body33.us.preheader ]
  %arrayidx37.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv69, i64 %indvars.iv58
  %6 = load double, double* %arrayidx37.us, align 8
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv65
  %7 = load double, double* %arrayidx41.us, align 8
  %mul42.us = fmul double %6, %7
  %sub47.us = fsub double %5, %mul42.us
  store double %sub47.us, double* %arrayidx46.us, align 8
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %arrayidx37.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv69, i64 %indvars.iv.next59
  %8 = load double, double* %arrayidx37.us.1, align 8
  %arrayidx41.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next59, i64 %indvars.iv65
  %9 = load double, double* %arrayidx41.us.1, align 8
  %mul42.us.1 = fmul double %8, %9
  %sub47.us.1 = fsub double %sub47.us, %mul42.us.1
  store double %sub47.us.1, double* %arrayidx46.us, align 8
  %indvars.iv.next59.1 = add nuw nsw i64 %indvars.iv58, 2
  %exitcond62.1 = icmp eq i64 %indvars.iv.next59.1, %indvars.iv69
  br i1 %exitcond62.1, label %for.cond31.for.inc51_crit_edge.us.loopexit, label %for.body33.us

for.cond31.for.inc51_crit_edge.us.loopexit:       ; preds = %for.body33.us
  br label %for.cond31.for.inc51_crit_edge.us

for.cond31.for.inc51_crit_edge.us:                ; preds = %for.cond31.for.inc51_crit_edge.us.loopexit, %for.body33.us.prol.loopexit
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %exitcond = icmp eq i64 %indvars.iv.next66, %0
  br i1 %exitcond, label %for.inc54.loopexit, label %for.cond31.preheader.us

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.end
  %indvars.iv51 = phi i64 [ %indvars.iv.next52, %for.end ], [ 0, %for.cond4.preheader.preheader ]
  %cmp536 = icmp sgt i64 %indvars.iv51, 0
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv69, i64 %indvars.iv51
  %.pre = load double, double* %arrayidx16, align 8
  br i1 %cmp536, label %for.body6.lr.ph, label %for.end

for.body6.lr.ph:                                  ; preds = %for.cond4.preheader
  %xtraiter = and i64 %indvars.iv51, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body6.prol.loopexit, label %for.body6.prol

for.body6.prol:                                   ; preds = %for.body6.lr.ph
  %10 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv51
  %11 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %10, %11
  %sub.prol = fsub double %.pre, %mul.prol
  store double %sub.prol, double* %arrayidx16, align 8
  br label %for.body6.prol.loopexit

for.body6.prol.loopexit:                          ; preds = %for.body6.prol, %for.body6.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body6.prol ], [ 0, %for.body6.lr.ph ]
  %.unr.ph = phi double [ %sub.prol, %for.body6.prol ], [ %.pre, %for.body6.lr.ph ]
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.body6.prol ], [ undef, %for.body6.lr.ph ]
  %12 = icmp eq i64 %indvars.iv51, 1
  br i1 %12, label %for.end, label %for.body6.preheader

for.body6.preheader:                              ; preds = %for.body6.prol.loopexit
  br label %for.body6

for.body6:                                        ; preds = %for.body6.preheader, %for.body6
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body6 ], [ %indvars.iv.unr.ph, %for.body6.preheader ]
  %13 = phi double [ %sub.1, %for.body6 ], [ %.unr.ph, %for.body6.preheader ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv69, i64 %indvars.iv
  %14 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv51
  %15 = load double, double* %arrayidx12, align 8
  %mul = fmul double %14, %15
  %sub = fsub double %13, %mul
  store double %sub, double* %arrayidx16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv69, i64 %indvars.iv.next
  %16 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv51
  %17 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %16, %17
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv51
  br i1 %exitcond.1, label %for.end.loopexit, label %for.body6

for.end.loopexit:                                 ; preds = %for.body6
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.cond4.preheader, %for.body6.prol.loopexit
  %18 = phi double [ %sub.lcssa.unr.ph, %for.body6.prol.loopexit ], [ %.pre, %for.cond4.preheader ], [ %sub.1, %for.end.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv51, i64 %indvars.iv51
  %19 = load double, double* %arrayidx20, align 8
  %div = fdiv double %18, %19
  store double %div, double* %arrayidx16, align 8
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next52, %indvars.iv69
  br i1 %exitcond56, label %for.cond31.preheader.us.preheader, label %for.cond4.preheader

for.inc54.loopexit:                               ; preds = %for.cond31.for.inc51_crit_edge.us
  br label %for.inc54

for.inc54:                                        ; preds = %for.inc54.loopexit, %for.cond1.preheader
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond76 = icmp eq i64 %indvars.iv.next70, %0
  br i1 %exitcond76, label %for.end56.loopexit, label %for.cond1.preheader

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
  %cmp11 = icmp sgt i32 %n, 0
  br i1 %cmp11, label %for.cond2.preheader.preheader, label %for.end12

for.cond2.preheader.preheader:                    ; preds = %entry
  %3 = sext i32 %n to i64
  %4 = zext i32 %n to i64
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc10, %for.cond2.preheader.preheader
  %indvars.iv14 = phi i64 [ 0, %for.cond2.preheader.preheader ], [ %indvars.iv.next15, %for.inc10 ]
  %5 = mul nsw i64 %indvars.iv14, %3
  br label %for.body4

for.body4:                                        ; preds = %if.end, %for.cond2.preheader
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %if.end ]
  %6 = add nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %rem = srem i32 %7, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %8) #6
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body4
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv14, i64 %indvars.iv
  %10 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %10) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next, %4
  br i1 %exitcond19, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %if.end
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond = icmp eq i64 %indvars.iv.next15, %4
  br i1 %exitcond, label %for.end12.loopexit, label %for.cond2.preheader

for.end12.loopexit:                               ; preds = %for.inc10
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %12) #6
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
