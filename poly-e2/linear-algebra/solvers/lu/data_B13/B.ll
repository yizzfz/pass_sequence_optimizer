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

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %n, [2000 x double]* %A) unnamed_addr #0 {
entry:
  %cmp96 = icmp sgt i32 %n, 0
  br i1 %cmp96, label %for.cond1.preheader.lr.ph, label %for.end25.thread

for.end25.thread:                                 ; preds = %entry
  %call168 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %for.end99

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %conv4 = sitofp i32 %n to double
  %0 = sext i32 %n to i64
  %1 = add i32 %n, -2
  %2 = zext i32 %1 to i64
  %3 = zext i32 %n to i64
  br label %for.body3.lr.ph

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader.lr.ph, %for.end18
  %indvars.iv137 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next138, %for.end18 ]
  %indvars.iv135 = phi i64 [ 1, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next136, %for.end18 ]
  %4 = mul nuw nsw i64 %indvars.iv137, 2001
  %5 = add nuw nsw i64 %4, 1
  %6 = sub i64 %2, %indvars.iv137
  %7 = shl i64 %6, 3
  %8 = and i64 %7, 34359738360
  br label %for.body3

for.cond8.preheader:                              ; preds = %for.body3
  %indvars.iv.next138 = add nuw nsw i64 %indvars.iv137, 1
  %cmp994 = icmp slt i64 %indvars.iv.next138, %0
  br i1 %cmp994, label %for.end18.loopexit, label %for.end18

for.body3:                                        ; preds = %for.body3, %for.body3.lr.ph
  %indvars.iv122 = phi i64 [ %indvars.iv.next123, %for.body3 ], [ 0, %for.body3.lr.ph ]
  %9 = sub nsw i64 0, %indvars.iv122
  %10 = trunc i64 %9 to i32
  %rem = srem i32 %10, %n
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, %conv4
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv137, i64 %indvars.iv122
  store double %add, double* %arrayidx6, align 8
  %indvars.iv.next123 = add nuw nsw i64 %indvars.iv122, 1
  %exitcond128 = icmp eq i64 %indvars.iv.next123, %indvars.iv135
  br i1 %exitcond128, label %for.cond8.preheader, label %for.body3

for.end18.loopexit:                               ; preds = %for.cond8.preheader
  %11 = add nuw nsw i64 %8, 8
  %scevgep156 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %5
  %12 = bitcast double* %scevgep156 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %12, i8 0, i64 %11, i32 8, i1 false)
  br label %for.end18

for.end18:                                        ; preds = %for.end18.loopexit, %for.cond8.preheader
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv137, i64 %indvars.iv137
  store double 1.000000e+00, double* %arrayidx22, align 8
  %indvars.iv.next136 = add nuw nsw i64 %indvars.iv135, 1
  %exitcond167 = icmp eq i64 %indvars.iv.next138, %3
  br i1 %exitcond167, label %for.end25, label %for.body3.lr.ph

for.end25:                                        ; preds = %for.end18
  %13 = icmp sgt i32 %n, 0
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br i1 %13, label %for.cond30.preheader.us.preheader, label %for.end99

for.cond30.preheader.us.preheader:                ; preds = %for.end25
  %14 = add i32 %n, -1
  %15 = zext i32 %14 to i64
  %16 = shl nuw nsw i64 %15, 3
  %17 = add nuw nsw i64 %16, 8
  %18 = zext i32 %n to i64
  %19 = add nsw i64 %18, -1
  %xtraiter162 = and i64 %18, 3
  %lcmp.mod163 = icmp eq i64 %xtraiter162, 0
  br i1 %lcmp.mod163, label %for.cond30.preheader.us.prol.loopexit, label %for.cond30.for.inc41_crit_edge.us.prol.preheader

for.cond30.for.inc41_crit_edge.us.prol.preheader: ; preds = %for.cond30.preheader.us.preheader
  br label %for.cond30.for.inc41_crit_edge.us.prol

for.cond30.for.inc41_crit_edge.us.prol:           ; preds = %for.cond30.for.inc41_crit_edge.us.prol.preheader, %for.cond30.for.inc41_crit_edge.us.prol
  %indvars.iv118.prol = phi i64 [ %indvars.iv.next119.prol, %for.cond30.for.inc41_crit_edge.us.prol ], [ 0, %for.cond30.for.inc41_crit_edge.us.prol.preheader ]
  %prol.iter164 = phi i64 [ %prol.iter164.sub, %for.cond30.for.inc41_crit_edge.us.prol ], [ %xtraiter162, %for.cond30.for.inc41_crit_edge.us.prol.preheader ]
  %20 = mul nuw nsw i64 %indvars.iv118.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %call, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %17, i32 8, i1 false)
  %indvars.iv.next119.prol = add nuw nsw i64 %indvars.iv118.prol, 1
  %prol.iter164.sub = add nsw i64 %prol.iter164, -1
  %prol.iter164.cmp = icmp eq i64 %prol.iter164.sub, 0
  br i1 %prol.iter164.cmp, label %for.cond30.preheader.us.prol.loopexit.loopexit, label %for.cond30.for.inc41_crit_edge.us.prol, !llvm.loop !1

for.cond30.preheader.us.prol.loopexit.loopexit:   ; preds = %for.cond30.for.inc41_crit_edge.us.prol
  br label %for.cond30.preheader.us.prol.loopexit

for.cond30.preheader.us.prol.loopexit:            ; preds = %for.cond30.preheader.us.prol.loopexit.loopexit, %for.cond30.preheader.us.preheader
  %indvars.iv118.unr = phi i64 [ 0, %for.cond30.preheader.us.preheader ], [ %xtraiter162, %for.cond30.preheader.us.prol.loopexit.loopexit ]
  %21 = icmp ult i64 %19, 3
  br i1 %21, label %for.cond44.preheader, label %for.cond30.for.inc41_crit_edge.us.3.preheader

for.cond30.for.inc41_crit_edge.us.3.preheader:    ; preds = %for.cond30.preheader.us.prol.loopexit
  %wide.trip.count152.3 = zext i32 %n to i64
  %22 = add nsw i64 %18, -4
  %23 = sub nsw i64 %22, %indvars.iv118.unr
  %24 = lshr i64 %23, 2
  %25 = and i64 %24, 1
  %lcmp.mod = icmp eq i64 %25, 0
  br i1 %lcmp.mod, label %for.cond30.for.inc41_crit_edge.us.3.prol.preheader, label %for.cond30.for.inc41_crit_edge.us.3.prol.loopexit

for.cond30.for.inc41_crit_edge.us.3.prol.preheader: ; preds = %for.cond30.for.inc41_crit_edge.us.3.preheader
  br label %for.cond30.for.inc41_crit_edge.us.3.prol

for.cond30.for.inc41_crit_edge.us.3.prol:         ; preds = %for.cond30.for.inc41_crit_edge.us.3.prol.preheader
  %26 = mul nuw nsw i64 %indvars.iv118.unr, 16000
  %scevgep.prol178 = getelementptr i8, i8* %call, i64 %26
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol178, i8 0, i64 %17, i32 8, i1 false)
  %27 = mul nuw nsw i64 %indvars.iv118.unr, 16000
  %28 = add nuw nsw i64 %27, 16000
  %scevgep.1.prol = getelementptr i8, i8* %call, i64 %28
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.prol, i8 0, i64 %17, i32 8, i1 false)
  %29 = mul nuw nsw i64 %indvars.iv118.unr, 16000
  %30 = add nuw nsw i64 %29, 32000
  %scevgep.2.prol = getelementptr i8, i8* %call, i64 %30
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.prol, i8 0, i64 %17, i32 8, i1 false)
  %31 = mul nuw nsw i64 %indvars.iv118.unr, 16000
  %32 = add nuw nsw i64 %31, 48000
  %scevgep.3.prol = getelementptr i8, i8* %call, i64 %32
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.prol, i8 0, i64 %17, i32 8, i1 false)
  %indvars.iv.next119.3.prol = or i64 %indvars.iv118.unr, 4
  br label %for.cond30.for.inc41_crit_edge.us.3.prol.loopexit

for.cond30.for.inc41_crit_edge.us.3.prol.loopexit: ; preds = %for.cond30.for.inc41_crit_edge.us.3.prol, %for.cond30.for.inc41_crit_edge.us.3.preheader
  %indvars.iv118.unr179 = phi i64 [ %indvars.iv118.unr, %for.cond30.for.inc41_crit_edge.us.3.preheader ], [ %indvars.iv.next119.3.prol, %for.cond30.for.inc41_crit_edge.us.3.prol ]
  %33 = icmp eq i64 %24, 0
  br i1 %33, label %for.cond44.preheader.loopexit, label %for.cond30.for.inc41_crit_edge.us.3.preheader.new

for.cond30.for.inc41_crit_edge.us.3.preheader.new: ; preds = %for.cond30.for.inc41_crit_edge.us.3.prol.loopexit
  br label %for.cond30.for.inc41_crit_edge.us.3

for.cond44.preheader.loopexit.unr-lcssa:          ; preds = %for.cond30.for.inc41_crit_edge.us.3
  br label %for.cond44.preheader.loopexit

for.cond44.preheader.loopexit:                    ; preds = %for.cond30.for.inc41_crit_edge.us.3.prol.loopexit, %for.cond44.preheader.loopexit.unr-lcssa
  br label %for.cond44.preheader

for.cond44.preheader:                             ; preds = %for.cond44.preheader.loopexit, %for.cond30.preheader.us.prol.loopexit
  %34 = icmp sgt i32 %n, 0
  br i1 %34, label %for.cond48.preheader.lr.ph, label %for.end99

for.cond48.preheader.lr.ph:                       ; preds = %for.cond44.preheader
  %35 = zext i32 %n to i64
  %xtraiter160 = and i64 %35, 1
  %wide.trip.count144.1 = zext i32 %n to i64
  %36 = icmp eq i64 %xtraiter160, 0
  %37 = icmp eq i32 %n, 1
  %38 = bitcast i8* %call to [2000 x [2000 x double]]*
  %39 = bitcast i8* %call to [2000 x [2000 x double]]*
  %sunkaddr = ptrtoint [2000 x double]* %A to i64
  br label %for.cond52.preheader.us.us.preheader

for.cond52.preheader.us.us.preheader:             ; preds = %for.cond48.preheader.lr.ph, %for.cond48.for.inc75_crit_edge.us
  %indvars.iv110 = phi i64 [ %indvars.iv.next111, %for.cond48.for.inc75_crit_edge.us ], [ 0, %for.cond48.preheader.lr.ph ]
  %sunkaddr173 = shl nuw nsw i64 %indvars.iv110, 3
  %sunkaddr174 = add i64 %sunkaddr, %sunkaddr173
  %sunkaddr175 = inttoptr i64 %sunkaddr174 to double*
  br label %for.cond52.preheader.us.us

for.cond48.for.inc75_crit_edge.us:                ; preds = %for.cond52.for.inc72_crit_edge.us.us
  %indvars.iv.next111 = add nuw nsw i64 %indvars.iv110, 1
  %exitcond166 = icmp eq i64 %indvars.iv.next111, %35
  br i1 %exitcond166, label %for.cond78.preheader, label %for.cond52.preheader.us.us.preheader

for.cond52.preheader.us.us:                       ; preds = %for.cond52.for.inc72_crit_edge.us.us, %for.cond52.preheader.us.us.preheader
  %indvars.iv106 = phi i64 [ 0, %for.cond52.preheader.us.us.preheader ], [ %indvars.iv.next107, %for.cond52.for.inc72_crit_edge.us.us ]
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv106, i64 %indvars.iv110
  br i1 %36, label %for.body55.us.us.prol.loopexit, label %for.body55.us.us.prol

for.body55.us.us.prol:                            ; preds = %for.cond52.preheader.us.us
  %40 = load double, double* %arrayidx59.us.us, align 8
  %41 = load double, double* %sunkaddr175, align 8
  %mul.us.us.prol = fmul double %40, %41
  %arrayidx67.us.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %39, i64 0, i64 %indvars.iv106, i64 0
  %42 = load double, double* %arrayidx67.us.us.prol, align 8
  %add68.us.us.prol = fadd double %42, %mul.us.us.prol
  store double %add68.us.us.prol, double* %arrayidx67.us.us.prol, align 8
  br label %for.body55.us.us.prol.loopexit

for.body55.us.us.prol.loopexit:                   ; preds = %for.body55.us.us.prol, %for.cond52.preheader.us.us
  %indvars.iv102.unr.ph = phi i64 [ 1, %for.body55.us.us.prol ], [ 0, %for.cond52.preheader.us.us ]
  br i1 %37, label %for.cond52.for.inc72_crit_edge.us.us, label %for.body55.us.us.preheader

for.body55.us.us.preheader:                       ; preds = %for.body55.us.us.prol.loopexit
  br label %for.body55.us.us

for.cond52.for.inc72_crit_edge.us.us.loopexit:    ; preds = %for.body55.us.us
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us:             ; preds = %for.cond52.for.inc72_crit_edge.us.us.loopexit, %for.body55.us.us.prol.loopexit
  %indvars.iv.next107 = add nuw nsw i64 %indvars.iv106, 1
  %exitcond = icmp eq i64 %indvars.iv.next107, %35
  br i1 %exitcond, label %for.cond48.for.inc75_crit_edge.us, label %for.cond52.preheader.us.us

for.body55.us.us:                                 ; preds = %for.body55.us.us.preheader, %for.body55.us.us
  %indvars.iv102 = phi i64 [ %indvars.iv.next103.1, %for.body55.us.us ], [ %indvars.iv102.unr.ph, %for.body55.us.us.preheader ]
  %43 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv102, i64 %indvars.iv110
  %44 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %43, %44
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv106, i64 %indvars.iv102
  %45 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %45, %mul.us.us
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %indvars.iv.next103 = add nuw nsw i64 %indvars.iv102, 1
  %46 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next103, i64 %indvars.iv110
  %47 = load double, double* %arrayidx63.us.us.1, align 8
  %mul.us.us.1 = fmul double %46, %47
  %arrayidx67.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv106, i64 %indvars.iv.next103
  %48 = load double, double* %arrayidx67.us.us.1, align 8
  %add68.us.us.1 = fadd double %48, %mul.us.us.1
  store double %add68.us.us.1, double* %arrayidx67.us.us.1, align 8
  %indvars.iv.next103.1 = add nuw nsw i64 %indvars.iv102, 2
  %exitcond145.1 = icmp eq i64 %indvars.iv.next103.1, %wide.trip.count144.1
  br i1 %exitcond145.1, label %for.cond52.for.inc72_crit_edge.us.us.loopexit, label %for.body55.us.us

for.cond78.preheader:                             ; preds = %for.cond48.for.inc75_crit_edge.us
  %49 = icmp sgt i32 %n, 0
  br i1 %49, label %for.cond82.preheader.us.preheader, label %for.end99

for.cond82.preheader.us.preheader:                ; preds = %for.cond78.preheader
  %50 = zext i32 %n to i64
  %51 = add nsw i64 %50, -1
  %xtraiter = and i64 %50, 3
  %wide.trip.count141.3 = zext i32 %n to i64
  %52 = icmp eq i64 %xtraiter, 0
  %53 = icmp ult i64 %51, 3
  %54 = bitcast i8* %call to [2000 x [2000 x double]]*
  %55 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond82.preheader.us

for.cond82.preheader.us:                          ; preds = %for.cond82.for.inc97_crit_edge.us, %for.cond82.preheader.us.preheader
  %indvars.iv98 = phi i64 [ 0, %for.cond82.preheader.us.preheader ], [ %indvars.iv.next99, %for.cond82.for.inc97_crit_edge.us ]
  br i1 %52, label %for.body85.us.prol.loopexit, label %for.body85.us.prol.preheader

for.body85.us.prol.preheader:                     ; preds = %for.cond82.preheader.us
  br label %for.body85.us.prol

for.body85.us.prol:                               ; preds = %for.body85.us.prol.preheader, %for.body85.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body85.us.prol ], [ 0, %for.body85.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body85.us.prol ], [ %xtraiter, %for.body85.us.prol.preheader ]
  %arrayidx89.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %55, i64 0, i64 %indvars.iv98, i64 %indvars.iv.prol
  %56 = bitcast double* %arrayidx89.us.prol to i64*
  %57 = load i64, i64* %56, align 8
  %arrayidx93.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv98, i64 %indvars.iv.prol
  %58 = bitcast double* %arrayidx93.us.prol to i64*
  store i64 %57, i64* %58, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body85.us.prol.loopexit.loopexit, label %for.body85.us.prol, !llvm.loop !3

for.body85.us.prol.loopexit.loopexit:             ; preds = %for.body85.us.prol
  br label %for.body85.us.prol.loopexit

for.body85.us.prol.loopexit:                      ; preds = %for.body85.us.prol.loopexit.loopexit, %for.cond82.preheader.us
  %indvars.iv.unr = phi i64 [ 0, %for.cond82.preheader.us ], [ %xtraiter, %for.body85.us.prol.loopexit.loopexit ]
  br i1 %53, label %for.cond82.for.inc97_crit_edge.us, label %for.body85.us.preheader

for.body85.us.preheader:                          ; preds = %for.body85.us.prol.loopexit
  br label %for.body85.us

for.body85.us:                                    ; preds = %for.body85.us.preheader, %for.body85.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body85.us ], [ %indvars.iv.unr, %for.body85.us.preheader ]
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %54, i64 0, i64 %indvars.iv98, i64 %indvars.iv
  %59 = bitcast double* %arrayidx89.us to i64*
  %60 = load i64, i64* %59, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv98, i64 %indvars.iv
  %61 = bitcast double* %arrayidx93.us to i64*
  store i64 %60, i64* %61, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %54, i64 0, i64 %indvars.iv98, i64 %indvars.iv.next
  %62 = bitcast double* %arrayidx89.us.1 to i64*
  %63 = load i64, i64* %62, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv98, i64 %indvars.iv.next
  %64 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %63, i64* %64, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %54, i64 0, i64 %indvars.iv98, i64 %indvars.iv.next.1
  %65 = bitcast double* %arrayidx89.us.2 to i64*
  %66 = load i64, i64* %65, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv98, i64 %indvars.iv.next.1
  %67 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %66, i64* %67, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %54, i64 0, i64 %indvars.iv98, i64 %indvars.iv.next.2
  %68 = bitcast double* %arrayidx89.us.3 to i64*
  %69 = load i64, i64* %68, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv98, i64 %indvars.iv.next.2
  %70 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %69, i64* %70, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond142.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count141.3
  br i1 %exitcond142.3, label %for.cond82.for.inc97_crit_edge.us.loopexit, label %for.body85.us

for.cond82.for.inc97_crit_edge.us.loopexit:       ; preds = %for.body85.us
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us:                ; preds = %for.cond82.for.inc97_crit_edge.us.loopexit, %for.body85.us.prol.loopexit
  %indvars.iv.next99 = add nuw nsw i64 %indvars.iv98, 1
  %exitcond165 = icmp eq i64 %indvars.iv.next99, %50
  br i1 %exitcond165, label %for.end99.loopexit, label %for.cond82.preheader.us

for.end99.loopexit:                               ; preds = %for.cond82.for.inc97_crit_edge.us
  br label %for.end99

for.end99:                                        ; preds = %for.end99.loopexit, %for.end25, %for.end25.thread, %for.cond44.preheader, %for.cond78.preheader
  %call169170172 = phi i8* [ %call, %for.cond78.preheader ], [ %call, %for.cond44.preheader ], [ %call, %for.end25 ], [ %call168, %for.end25.thread ], [ %call, %for.end99.loopexit ]
  tail call void @free(i8* %call169170172) #4
  ret void

for.cond30.for.inc41_crit_edge.us.3:              ; preds = %for.cond30.for.inc41_crit_edge.us.3, %for.cond30.for.inc41_crit_edge.us.3.preheader.new
  %indvars.iv118 = phi i64 [ %indvars.iv118.unr179, %for.cond30.for.inc41_crit_edge.us.3.preheader.new ], [ %indvars.iv.next119.3.1, %for.cond30.for.inc41_crit_edge.us.3 ]
  %71 = mul nuw nsw i64 %indvars.iv118, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %71
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %17, i32 8, i1 false)
  %72 = mul i64 %indvars.iv118, 16000
  %73 = add i64 %72, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %73
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %17, i32 8, i1 false)
  %74 = mul i64 %indvars.iv118, 16000
  %75 = add i64 %74, 32000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %75
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %17, i32 8, i1 false)
  %76 = mul i64 %indvars.iv118, 16000
  %77 = add i64 %76, 48000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %77
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %17, i32 8, i1 false)
  %indvars.iv.next119.3 = add nuw nsw i64 %indvars.iv118, 4
  %78 = mul nuw nsw i64 %indvars.iv.next119.3, 16000
  %scevgep.1180 = getelementptr i8, i8* %call, i64 %78
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1180, i8 0, i64 %17, i32 8, i1 false)
  %79 = mul i64 %indvars.iv.next119.3, 16000
  %80 = add i64 %79, 16000
  %scevgep.1.1 = getelementptr i8, i8* %call, i64 %80
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 %17, i32 8, i1 false)
  %81 = mul i64 %indvars.iv.next119.3, 16000
  %82 = add i64 %81, 32000
  %scevgep.2.1 = getelementptr i8, i8* %call, i64 %82
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 %17, i32 8, i1 false)
  %83 = mul i64 %indvars.iv.next119.3, 16000
  %84 = add i64 %83, 48000
  %scevgep.3.1 = getelementptr i8, i8* %call, i64 %84
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 %17, i32 8, i1 false)
  %indvars.iv.next119.3.1 = add nsw i64 %indvars.iv118, 8
  %exitcond153.3.1 = icmp eq i64 %indvars.iv.next119.3.1, %wide.trip.count152.3
  br i1 %exitcond153.3.1, label %for.cond44.preheader.loopexit.unr-lcssa, label %for.cond30.for.inc41_crit_edge.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32 %n, [2000 x double]* %A) unnamed_addr #2 {
entry:
  %cmp44 = icmp sgt i32 %n, 0
  br i1 %cmp44, label %for.cond1.preheader.preheader, label %for.end56

for.cond1.preheader.preheader:                    ; preds = %entry
  %0 = zext i32 %n to i64
  %1 = zext i32 %n to i64
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc54, %for.cond1.preheader.preheader
  %indvars.iv71 = phi i64 [ 0, %for.cond1.preheader.preheader ], [ %indvars.iv.next72, %for.inc54 ]
  %cmp238 = icmp sgt i64 %indvars.iv71, 0
  br i1 %cmp238, label %for.cond4.preheader.preheader, label %for.inc54

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv71, i64 0
  br label %for.cond4.preheader

for.cond31.preheader.lr.ph:                       ; preds = %for.end
  %2 = icmp sgt i64 %indvars.iv71, 0
  br i1 %2, label %for.cond31.preheader.us.preheader, label %for.inc54

for.cond31.preheader.us.preheader:                ; preds = %for.cond31.preheader.lr.ph
  %xtraiter78 = and i64 %indvars.iv71, 1
  %arrayidx37.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv71, i64 0
  %3 = icmp eq i64 %xtraiter78, 0
  %4 = icmp eq i64 %indvars.iv71, 1
  br label %for.cond31.preheader.us

for.cond31.preheader.us:                          ; preds = %for.cond31.preheader.us.preheader, %for.cond31.for.inc51_crit_edge.us
  %indvars.iv67 = phi i64 [ %indvars.iv.next68, %for.cond31.for.inc51_crit_edge.us ], [ %indvars.iv71, %for.cond31.preheader.us.preheader ]
  %arrayidx46.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv71, i64 %indvars.iv67
  %.pre49 = load double, double* %arrayidx46.us, align 8
  br i1 %3, label %for.body33.us.prol.loopexit, label %for.body33.us.prol

for.body33.us.prol:                               ; preds = %for.cond31.preheader.us
  %5 = load double, double* %arrayidx37.us.prol, align 8
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv67
  %6 = load double, double* %arrayidx41.us.prol, align 8
  %mul42.us.prol = fmul double %5, %6
  %sub47.us.prol = fsub double %.pre49, %mul42.us.prol
  store double %sub47.us.prol, double* %arrayidx46.us, align 8
  br label %for.body33.us.prol.loopexit

for.body33.us.prol.loopexit:                      ; preds = %for.body33.us.prol, %for.cond31.preheader.us
  %indvars.iv60.unr.ph = phi i64 [ 1, %for.body33.us.prol ], [ 0, %for.cond31.preheader.us ]
  %.unr80.ph = phi double [ %sub47.us.prol, %for.body33.us.prol ], [ %.pre49, %for.cond31.preheader.us ]
  br i1 %4, label %for.cond31.for.inc51_crit_edge.us, label %for.body33.us.preheader

for.body33.us.preheader:                          ; preds = %for.body33.us.prol.loopexit
  br label %for.body33.us

for.body33.us:                                    ; preds = %for.body33.us.preheader, %for.body33.us
  %indvars.iv60 = phi i64 [ %indvars.iv.next61.1, %for.body33.us ], [ %indvars.iv60.unr.ph, %for.body33.us.preheader ]
  %7 = phi double [ %sub47.us.1, %for.body33.us ], [ %.unr80.ph, %for.body33.us.preheader ]
  %arrayidx37.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv71, i64 %indvars.iv60
  %8 = load double, double* %arrayidx37.us, align 8
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv67
  %9 = load double, double* %arrayidx41.us, align 8
  %mul42.us = fmul double %8, %9
  %sub47.us = fsub double %7, %mul42.us
  store double %sub47.us, double* %arrayidx46.us, align 8
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %arrayidx37.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv71, i64 %indvars.iv.next61
  %10 = load double, double* %arrayidx37.us.1, align 8
  %arrayidx41.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next61, i64 %indvars.iv67
  %11 = load double, double* %arrayidx41.us.1, align 8
  %mul42.us.1 = fmul double %10, %11
  %sub47.us.1 = fsub double %sub47.us, %mul42.us.1
  store double %sub47.us.1, double* %arrayidx46.us, align 8
  %indvars.iv.next61.1 = add nuw nsw i64 %indvars.iv60, 2
  %exitcond64.1 = icmp eq i64 %indvars.iv.next61.1, %indvars.iv71
  br i1 %exitcond64.1, label %for.cond31.for.inc51_crit_edge.us.loopexit, label %for.body33.us

for.cond31.for.inc51_crit_edge.us.loopexit:       ; preds = %for.body33.us
  br label %for.cond31.for.inc51_crit_edge.us

for.cond31.for.inc51_crit_edge.us:                ; preds = %for.cond31.for.inc51_crit_edge.us.loopexit, %for.body33.us.prol.loopexit
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond = icmp eq i64 %indvars.iv.next68, %0
  br i1 %exitcond, label %for.inc54.loopexit, label %for.cond31.preheader.us

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.end
  %indvars.iv53 = phi i64 [ %indvars.iv.next54, %for.end ], [ 0, %for.cond4.preheader.preheader ]
  %cmp536 = icmp sgt i64 %indvars.iv53, 0
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv71, i64 %indvars.iv53
  %.pre = load double, double* %arrayidx16, align 8
  br i1 %cmp536, label %for.body6.lr.ph, label %for.end

for.body6.lr.ph:                                  ; preds = %for.cond4.preheader
  %xtraiter = and i64 %indvars.iv53, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body6.prol.loopexit, label %for.body6.prol

for.body6.prol:                                   ; preds = %for.body6.lr.ph
  %12 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv53
  %13 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %12, %13
  %sub.prol = fsub double %.pre, %mul.prol
  store double %sub.prol, double* %arrayidx16, align 8
  br label %for.body6.prol.loopexit

for.body6.prol.loopexit:                          ; preds = %for.body6.prol, %for.body6.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body6.prol ], [ 0, %for.body6.lr.ph ]
  %.unr.ph = phi double [ %sub.prol, %for.body6.prol ], [ %.pre, %for.body6.lr.ph ]
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.body6.prol ], [ undef, %for.body6.lr.ph ]
  %14 = icmp eq i64 %indvars.iv53, 1
  br i1 %14, label %for.end, label %for.body6.preheader

for.body6.preheader:                              ; preds = %for.body6.prol.loopexit
  br label %for.body6

for.body6:                                        ; preds = %for.body6.preheader, %for.body6
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body6 ], [ %indvars.iv.unr.ph, %for.body6.preheader ]
  %15 = phi double [ %sub.1, %for.body6 ], [ %.unr.ph, %for.body6.preheader ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv71, i64 %indvars.iv
  %16 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv53
  %17 = load double, double* %arrayidx12, align 8
  %mul = fmul double %16, %17
  %sub = fsub double %15, %mul
  store double %sub, double* %arrayidx16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv71, i64 %indvars.iv.next
  %18 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv53
  %19 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %18, %19
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv53
  br i1 %exitcond.1, label %for.end.loopexit, label %for.body6

for.end.loopexit:                                 ; preds = %for.body6
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.cond4.preheader, %for.body6.prol.loopexit
  %20 = phi double [ %sub.lcssa.unr.ph, %for.body6.prol.loopexit ], [ %.pre, %for.cond4.preheader ], [ %sub.1, %for.end.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv53, i64 %indvars.iv53
  %21 = load double, double* %arrayidx20, align 8
  %div = fdiv double %20, %21
  store double %div, double* %arrayidx16, align 8
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond58 = icmp eq i64 %indvars.iv.next54, %indvars.iv71
  br i1 %exitcond58, label %for.cond31.preheader.lr.ph, label %for.cond4.preheader

for.inc54.loopexit:                               ; preds = %for.cond31.for.inc51_crit_edge.us
  br label %for.inc54

for.inc54:                                        ; preds = %for.inc54.loopexit, %for.cond1.preheader, %for.cond31.preheader.lr.ph
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %exitcond81 = icmp eq i64 %indvars.iv.next72, %1
  br i1 %exitcond81, label %for.end56.loopexit, label %for.cond1.preheader

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
  br i1 %cmp11, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %n to i64
  %4 = zext i32 %n to i64
  %5 = zext i32 %n to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv14 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next15, %for.cond2.for.inc10_crit_edge.us ]
  %6 = mul nsw i64 %indvars.iv14, %3
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %if.end.us ]
  %7 = add nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %rem.us = srem i32 %8, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %9) #6
  br label %if.end.us

if.end.us:                                        ; preds = %if.then.us, %for.body4.us
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv14, i64 %indvars.iv
  %11 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %11) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next, %4
  br i1 %exitcond21, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next15, %5
  br i1 %exitcond22, label %for.end12.loopexit, label %for.cond2.preheader.us

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
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
