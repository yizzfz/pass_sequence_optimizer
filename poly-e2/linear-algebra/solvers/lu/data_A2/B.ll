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
  %1 = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %n, [2000 x double]* nocapture %A) unnamed_addr #0 {
entry:
  %cmp40 = icmp sgt i32 %n, 0
  br i1 %cmp40, label %for.cond1.preheader.lr.ph, label %for.end25.thread

for.end25.thread:                                 ; preds = %entry
  %call96 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %for.end99

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %conv4 = sitofp i32 %n to double
  %0 = add i32 %n, -2
  %1 = zext i32 %0 to i64
  %2 = sext i32 %n to i64
  %3 = zext i32 %n to i64
  br label %for.body3.lr.ph

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader.lr.ph, %for.end18
  %indvars.iv89 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next90, %for.end18 ]
  %indvars.iv87 = phi i64 [ 1, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next88, %for.end18 ]
  %4 = add nuw nsw i64 %indvars.iv89, 1
  %scevgep84 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %4
  %5 = sub i64 %1, %indvars.iv89
  %6 = shl i64 %5, 3
  %7 = and i64 %6, 34359738360
  %8 = add nuw nsw i64 %7, 8
  br label %for.body3

for.cond8.preheader:                              ; preds = %for.body3
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1
  %cmp938 = icmp slt i64 %indvars.iv.next90, %2
  br i1 %cmp938, label %for.end18.loopexit, label %for.end18

for.body3:                                        ; preds = %for.body3, %for.body3.lr.ph
  %indvars.iv71 = phi i64 [ %indvars.iv.next72, %for.body3 ], [ 0, %for.body3.lr.ph ]
  %9 = sub nsw i64 0, %indvars.iv71
  %10 = trunc i64 %9 to i32
  %rem = srem i32 %10, %n
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, %conv4
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv89, i64 %indvars.iv71
  store double %add, double* %arrayidx6, align 8
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %exitcond77 = icmp eq i64 %indvars.iv.next72, %indvars.iv87
  br i1 %exitcond77, label %for.cond8.preheader, label %for.body3

for.end18.loopexit:                               ; preds = %for.cond8.preheader
  %11 = mul nuw nsw i64 %indvars.iv89, 2000
  %scevgep85 = getelementptr double, double* %scevgep84, i64 %11
  %scevgep8586 = bitcast double* %scevgep85 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep8586, i8 0, i64 %8, i32 8, i1 false)
  br label %for.end18

for.end18:                                        ; preds = %for.end18.loopexit, %for.cond8.preheader
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv89, i64 %indvars.iv89
  store double 1.000000e+00, double* %arrayidx22, align 8
  %indvars.iv.next88 = add nuw nsw i64 %indvars.iv87, 1
  %exitcond95 = icmp eq i64 %indvars.iv.next90, %3
  br i1 %exitcond95, label %for.end25, label %for.body3.lr.ph

for.end25:                                        ; preds = %for.end18
  %12 = icmp sgt i32 %n, 0
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br i1 %12, label %for.cond30.preheader.us.preheader, label %for.end99

for.cond30.preheader.us.preheader:                ; preds = %for.end25
  %13 = add i32 %n, -1
  %14 = zext i32 %13 to i64
  %15 = shl nuw nsw i64 %14, 3
  %16 = add nuw nsw i64 %15, 8
  %xtraiter68 = and i32 %n, 3
  %lcmp.mod69 = icmp eq i32 %xtraiter68, 0
  br i1 %lcmp.mod69, label %for.cond30.preheader.us.prol.loopexit, label %for.cond30.preheader.us.prol.preheader

for.cond30.preheader.us.prol.preheader:           ; preds = %for.cond30.preheader.us.preheader
  %17 = add nsw i32 %xtraiter68, -1
  %18 = zext i32 %17 to i64
  br label %for.cond30.for.inc41_crit_edge.us.prol

for.cond30.for.inc41_crit_edge.us.prol:           ; preds = %for.cond30.preheader.us.prol.preheader, %for.cond30.for.inc41_crit_edge.us.prol
  %indvars.iv64.prol = phi i64 [ 0, %for.cond30.preheader.us.prol.preheader ], [ %indvars.iv.next65.prol, %for.cond30.for.inc41_crit_edge.us.prol ]
  %prol.iter70 = phi i32 [ %xtraiter68, %for.cond30.preheader.us.prol.preheader ], [ %prol.iter70.sub, %for.cond30.for.inc41_crit_edge.us.prol ]
  %19 = mul nuw nsw i64 %indvars.iv64.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %call, i64 %19
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %16, i32 8, i1 false)
  %indvars.iv.next65.prol = add nuw nsw i64 %indvars.iv64.prol, 1
  %prol.iter70.sub = add nsw i32 %prol.iter70, -1
  %prol.iter70.cmp = icmp eq i32 %prol.iter70.sub, 0
  br i1 %prol.iter70.cmp, label %for.cond30.preheader.us.prol.loopexit.unr-lcssa, label %for.cond30.for.inc41_crit_edge.us.prol, !llvm.loop !1

for.cond30.preheader.us.prol.loopexit.unr-lcssa:  ; preds = %for.cond30.for.inc41_crit_edge.us.prol
  %20 = add nuw nsw i64 %18, 1
  br label %for.cond30.preheader.us.prol.loopexit

for.cond30.preheader.us.prol.loopexit:            ; preds = %for.cond30.preheader.us.preheader, %for.cond30.preheader.us.prol.loopexit.unr-lcssa
  %indvars.iv64.unr = phi i64 [ 0, %for.cond30.preheader.us.preheader ], [ %20, %for.cond30.preheader.us.prol.loopexit.unr-lcssa ]
  %21 = icmp ult i32 %13, 3
  br i1 %21, label %for.cond44.preheader, label %for.cond30.for.inc41_crit_edge.us.3.preheader

for.cond30.for.inc41_crit_edge.us.3.preheader:    ; preds = %for.cond30.preheader.us.prol.loopexit
  %wide.trip.count66.3 = zext i32 %n to i64
  %22 = add nsw i64 %wide.trip.count66.3, -4
  %23 = sub nsw i64 %22, %indvars.iv64.unr
  %24 = lshr i64 %23, 2
  %25 = and i64 %24, 1
  %lcmp.mod = icmp eq i64 %25, 0
  br i1 %lcmp.mod, label %for.cond30.for.inc41_crit_edge.us.3.prol.preheader, label %for.cond30.for.inc41_crit_edge.us.3.prol.loopexit

for.cond30.for.inc41_crit_edge.us.3.prol.preheader: ; preds = %for.cond30.for.inc41_crit_edge.us.3.preheader
  br label %for.cond30.for.inc41_crit_edge.us.3.prol

for.cond30.for.inc41_crit_edge.us.3.prol:         ; preds = %for.cond30.for.inc41_crit_edge.us.3.prol.preheader
  %26 = mul nuw nsw i64 %indvars.iv64.unr, 16000
  %scevgep.prol106 = getelementptr i8, i8* %call, i64 %26
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol106, i8 0, i64 %16, i32 8, i1 false)
  %27 = mul nsw i64 %indvars.iv64.unr, 16000
  %28 = add i64 %27, 16000
  %scevgep.1.prol = getelementptr i8, i8* %call, i64 %28
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.prol, i8 0, i64 %16, i32 8, i1 false)
  %29 = mul nsw i64 %indvars.iv64.unr, 16000
  %30 = add i64 %29, 32000
  %scevgep.2.prol = getelementptr i8, i8* %call, i64 %30
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.prol, i8 0, i64 %16, i32 8, i1 false)
  %31 = mul nsw i64 %indvars.iv64.unr, 16000
  %32 = add i64 %31, 48000
  %scevgep.3.prol = getelementptr i8, i8* %call, i64 %32
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.prol, i8 0, i64 %16, i32 8, i1 false)
  %indvars.iv.next65.3.prol = add nsw i64 %indvars.iv64.unr, 4
  br label %for.cond30.for.inc41_crit_edge.us.3.prol.loopexit

for.cond30.for.inc41_crit_edge.us.3.prol.loopexit: ; preds = %for.cond30.for.inc41_crit_edge.us.3.prol, %for.cond30.for.inc41_crit_edge.us.3.preheader
  %indvars.iv64.unr107 = phi i64 [ %indvars.iv64.unr, %for.cond30.for.inc41_crit_edge.us.3.preheader ], [ %indvars.iv.next65.3.prol, %for.cond30.for.inc41_crit_edge.us.3.prol ]
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
  %36 = zext i32 %n to i64
  %xtraiter50 = and i32 %n, 1
  %wide.trip.count48.1 = zext i32 %n to i64
  %37 = icmp eq i32 %xtraiter50, 0
  %38 = icmp eq i32 %n, 1
  %39 = bitcast i8* %call to [2000 x [2000 x double]]*
  %40 = bitcast i8* %call to [2000 x [2000 x double]]*
  %sunkaddr = ptrtoint [2000 x double]* %A to i64
  br label %for.cond52.preheader.us.us.preheader

for.cond52.preheader.us.us.preheader:             ; preds = %for.cond48.preheader.lr.ph, %for.cond48.for.inc75_crit_edge.us
  %indvars.iv56 = phi i64 [ %indvars.iv.next57, %for.cond48.for.inc75_crit_edge.us ], [ 0, %for.cond48.preheader.lr.ph ]
  %sunkaddr101 = shl i64 %indvars.iv56, 3
  %sunkaddr102 = add i64 %sunkaddr, %sunkaddr101
  %sunkaddr103 = inttoptr i64 %sunkaddr102 to double*
  br label %for.cond52.preheader.us.us

for.cond48.for.inc75_crit_edge.us:                ; preds = %for.cond52.for.inc72_crit_edge.us.us
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond94 = icmp eq i64 %indvars.iv.next57, %36
  br i1 %exitcond94, label %for.cond78.preheader, label %for.cond52.preheader.us.us.preheader

for.cond52.preheader.us.us:                       ; preds = %for.cond52.for.inc72_crit_edge.us.us, %for.cond52.preheader.us.us.preheader
  %indvars.iv52 = phi i64 [ 0, %for.cond52.preheader.us.us.preheader ], [ %indvars.iv.next53, %for.cond52.for.inc72_crit_edge.us.us ]
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv56
  br i1 %37, label %for.body55.us.us.prol.loopexit, label %for.body55.us.us.prol

for.body55.us.us.prol:                            ; preds = %for.cond52.preheader.us.us
  %41 = load double, double* %arrayidx59.us.us, align 8
  %42 = load double, double* %sunkaddr103, align 8
  %mul.us.us.prol = fmul double %41, %42
  %arrayidx67.us.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv52, i64 0
  %43 = load double, double* %arrayidx67.us.us.prol, align 8
  %add68.us.us.prol = fadd double %43, %mul.us.us.prol
  store double %add68.us.us.prol, double* %arrayidx67.us.us.prol, align 8
  br label %for.body55.us.us.prol.loopexit

for.body55.us.us.prol.loopexit:                   ; preds = %for.body55.us.us.prol, %for.cond52.preheader.us.us
  %indvars.iv46.unr.ph = phi i64 [ 1, %for.body55.us.us.prol ], [ 0, %for.cond52.preheader.us.us ]
  br i1 %38, label %for.cond52.for.inc72_crit_edge.us.us, label %for.body55.us.us.preheader

for.body55.us.us.preheader:                       ; preds = %for.body55.us.us.prol.loopexit
  br label %for.body55.us.us

for.cond52.for.inc72_crit_edge.us.us.loopexit:    ; preds = %for.body55.us.us
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us:             ; preds = %for.cond52.for.inc72_crit_edge.us.us.loopexit, %for.body55.us.us.prol.loopexit
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond = icmp eq i64 %indvars.iv.next53, %35
  br i1 %exitcond, label %for.cond48.for.inc75_crit_edge.us, label %for.cond52.preheader.us.us

for.body55.us.us:                                 ; preds = %for.body55.us.us.preheader, %for.body55.us.us
  %indvars.iv46 = phi i64 [ %indvars.iv.next47.1, %for.body55.us.us ], [ %indvars.iv46.unr.ph, %for.body55.us.us.preheader ]
  %44 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv56
  %45 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %44, %45
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %39, i64 0, i64 %indvars.iv52, i64 %indvars.iv46
  %46 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %46, %mul.us.us
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %47 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next47, i64 %indvars.iv56
  %48 = load double, double* %arrayidx63.us.us.1, align 8
  %mul.us.us.1 = fmul double %47, %48
  %arrayidx67.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %39, i64 0, i64 %indvars.iv52, i64 %indvars.iv.next47
  %49 = load double, double* %arrayidx67.us.us.1, align 8
  %add68.us.us.1 = fadd double %49, %mul.us.us.1
  store double %add68.us.us.1, double* %arrayidx67.us.us.1, align 8
  %indvars.iv.next47.1 = add nsw i64 %indvars.iv46, 2
  %exitcond49.1 = icmp eq i64 %indvars.iv.next47.1, %wide.trip.count48.1
  br i1 %exitcond49.1, label %for.cond52.for.inc72_crit_edge.us.us.loopexit, label %for.body55.us.us

for.cond78.preheader:                             ; preds = %for.cond48.for.inc75_crit_edge.us
  %50 = icmp sgt i32 %n, 0
  br i1 %50, label %for.cond82.preheader.us.preheader, label %for.end99

for.cond82.preheader.us.preheader:                ; preds = %for.cond78.preheader
  %51 = add i32 %n, -1
  %52 = and i32 %n, 3
  %53 = add nsw i32 %52, -1
  %54 = zext i32 %53 to i64
  %55 = add nuw nsw i64 %54, 1
  %56 = zext i32 %n to i64
  %xtraiter = and i32 %n, 3
  %wide.trip.count.3 = zext i32 %n to i64
  %57 = icmp eq i32 %xtraiter, 0
  %58 = icmp ult i32 %51, 3
  %59 = bitcast i8* %call to [2000 x [2000 x double]]*
  %60 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond82.preheader.us

for.cond82.preheader.us:                          ; preds = %for.cond82.for.inc97_crit_edge.us, %for.cond82.preheader.us.preheader
  %indvars.iv43 = phi i64 [ 0, %for.cond82.preheader.us.preheader ], [ %indvars.iv.next44, %for.cond82.for.inc97_crit_edge.us ]
  br i1 %57, label %for.body85.us.prol.loopexit, label %for.body85.us.prol.preheader

for.body85.us.prol.preheader:                     ; preds = %for.cond82.preheader.us
  br label %for.body85.us.prol

for.body85.us.prol:                               ; preds = %for.body85.us.prol.preheader, %for.body85.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body85.us.prol ], [ 0, %for.body85.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body85.us.prol ], [ %xtraiter, %for.body85.us.prol.preheader ]
  %arrayidx89.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %60, i64 0, i64 %indvars.iv43, i64 %indvars.iv.prol
  %61 = bitcast double* %arrayidx89.us.prol to i64*
  %62 = load i64, i64* %61, align 8
  %arrayidx93.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv43, i64 %indvars.iv.prol
  %63 = bitcast double* %arrayidx93.us.prol to i64*
  store i64 %62, i64* %63, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body85.us.prol.loopexit.loopexit, label %for.body85.us.prol, !llvm.loop !3

for.body85.us.prol.loopexit.loopexit:             ; preds = %for.body85.us.prol
  br label %for.body85.us.prol.loopexit

for.body85.us.prol.loopexit:                      ; preds = %for.body85.us.prol.loopexit.loopexit, %for.cond82.preheader.us
  %indvars.iv.unr = phi i64 [ 0, %for.cond82.preheader.us ], [ %55, %for.body85.us.prol.loopexit.loopexit ]
  br i1 %58, label %for.cond82.for.inc97_crit_edge.us, label %for.body85.us.preheader

for.body85.us.preheader:                          ; preds = %for.body85.us.prol.loopexit
  br label %for.body85.us

for.body85.us:                                    ; preds = %for.body85.us.preheader, %for.body85.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body85.us ], [ %indvars.iv.unr, %for.body85.us.preheader ]
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %59, i64 0, i64 %indvars.iv43, i64 %indvars.iv
  %64 = bitcast double* %arrayidx89.us to i64*
  %65 = load i64, i64* %64, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv43, i64 %indvars.iv
  %66 = bitcast double* %arrayidx93.us to i64*
  store i64 %65, i64* %66, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %59, i64 0, i64 %indvars.iv43, i64 %indvars.iv.next
  %67 = bitcast double* %arrayidx89.us.1 to i64*
  %68 = load i64, i64* %67, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv43, i64 %indvars.iv.next
  %69 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %68, i64* %69, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %59, i64 0, i64 %indvars.iv43, i64 %indvars.iv.next.1
  %70 = bitcast double* %arrayidx89.us.2 to i64*
  %71 = load i64, i64* %70, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv43, i64 %indvars.iv.next.1
  %72 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %71, i64* %72, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %59, i64 0, i64 %indvars.iv43, i64 %indvars.iv.next.2
  %73 = bitcast double* %arrayidx89.us.3 to i64*
  %74 = load i64, i64* %73, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv43, i64 %indvars.iv.next.2
  %75 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %74, i64* %75, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %for.cond82.for.inc97_crit_edge.us.loopexit, label %for.body85.us

for.cond82.for.inc97_crit_edge.us.loopexit:       ; preds = %for.body85.us
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us:                ; preds = %for.cond82.for.inc97_crit_edge.us.loopexit, %for.body85.us.prol.loopexit
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond93 = icmp eq i64 %indvars.iv.next44, %56
  br i1 %exitcond93, label %for.end99.loopexit, label %for.cond82.preheader.us

for.end99.loopexit:                               ; preds = %for.cond82.for.inc97_crit_edge.us
  br label %for.end99

for.end99:                                        ; preds = %for.end99.loopexit, %for.end25, %for.end25.thread, %for.cond44.preheader, %for.cond78.preheader
  %call9798100 = phi i8* [ %call, %for.cond78.preheader ], [ %call, %for.cond44.preheader ], [ %call, %for.end25 ], [ %call96, %for.end25.thread ], [ %call, %for.end99.loopexit ]
  tail call void @free(i8* %call9798100) #4
  ret void

for.cond30.for.inc41_crit_edge.us.3:              ; preds = %for.cond30.for.inc41_crit_edge.us.3, %for.cond30.for.inc41_crit_edge.us.3.preheader.new
  %indvars.iv64 = phi i64 [ %indvars.iv64.unr107, %for.cond30.for.inc41_crit_edge.us.3.preheader.new ], [ %indvars.iv.next65.3.1, %for.cond30.for.inc41_crit_edge.us.3 ]
  %76 = mul nuw nsw i64 %indvars.iv64, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %76
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %16, i32 8, i1 false)
  %77 = mul i64 %indvars.iv64, 16000
  %78 = add i64 %77, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %78
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %16, i32 8, i1 false)
  %79 = mul i64 %indvars.iv64, 16000
  %80 = add i64 %79, 32000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %80
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %16, i32 8, i1 false)
  %81 = mul i64 %indvars.iv64, 16000
  %82 = add i64 %81, 48000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %82
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %16, i32 8, i1 false)
  %indvars.iv.next65.3 = add nsw i64 %indvars.iv64, 4
  %83 = mul nuw nsw i64 %indvars.iv.next65.3, 16000
  %scevgep.1108 = getelementptr i8, i8* %call, i64 %83
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1108, i8 0, i64 %16, i32 8, i1 false)
  %84 = mul i64 %indvars.iv.next65.3, 16000
  %85 = add i64 %84, 16000
  %scevgep.1.1 = getelementptr i8, i8* %call, i64 %85
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 %16, i32 8, i1 false)
  %86 = mul i64 %indvars.iv.next65.3, 16000
  %87 = add i64 %86, 32000
  %scevgep.2.1 = getelementptr i8, i8* %call, i64 %87
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 %16, i32 8, i1 false)
  %88 = mul i64 %indvars.iv.next65.3, 16000
  %89 = add i64 %88, 48000
  %scevgep.3.1 = getelementptr i8, i8* %call, i64 %89
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 %16, i32 8, i1 false)
  %indvars.iv.next65.3.1 = add nsw i64 %indvars.iv64, 8
  %exitcond67.3.1 = icmp eq i64 %indvars.iv.next65.3.1, %wide.trip.count66.3
  br i1 %exitcond67.3.1, label %for.cond44.preheader.loopexit.unr-lcssa, label %for.cond30.for.inc41_crit_edge.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32 %n, [2000 x double]* nocapture %A) unnamed_addr #2 {
entry:
  %cmp9 = icmp sgt i32 %n, 0
  br i1 %cmp9, label %for.cond1.preheader.preheader, label %for.end56

for.cond1.preheader.preheader:                    ; preds = %entry
  %0 = zext i32 %n to i64
  %1 = zext i32 %n to i64
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc54, %for.cond1.preheader.preheader
  %indvars.iv42 = phi i64 [ 0, %for.cond1.preheader.preheader ], [ %indvars.iv.next43, %for.inc54 ]
  %2 = add i64 %indvars.iv42, 4294967295
  %cmp23 = icmp sgt i64 %indvars.iv42, 0
  br i1 %cmp23, label %for.cond4.preheader.preheader, label %for.inc54

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv42, i64 0
  br label %for.cond4.preheader

for.cond31.preheader.lr.ph:                       ; preds = %for.end
  %3 = icmp sgt i64 %indvars.iv42, 0
  br i1 %3, label %for.cond31.preheader.us.preheader, label %for.inc54

for.cond31.preheader.us.preheader:                ; preds = %for.cond31.preheader.lr.ph
  %xtraiter3148 = and i64 %indvars.iv42, 1
  %4 = trunc i64 %2 to i32
  %arrayidx37.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv42, i64 0
  %5 = icmp eq i64 %xtraiter3148, 0
  %6 = icmp eq i32 %4, 0
  br label %for.cond31.preheader.us

for.cond31.preheader.us:                          ; preds = %for.cond31.preheader.us.preheader, %for.cond31.for.inc51_crit_edge.us
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %for.cond31.for.inc51_crit_edge.us ], [ %indvars.iv42, %for.cond31.preheader.us.preheader ]
  %arrayidx46.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv42, i64 %indvars.iv36
  %.pre14 = load double, double* %arrayidx46.us, align 8
  br i1 %5, label %for.body33.us.prol.loopexit, label %for.body33.us.prol

for.body33.us.prol:                               ; preds = %for.cond31.preheader.us
  %7 = load double, double* %arrayidx37.us.prol, align 8
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv36
  %8 = load double, double* %arrayidx41.us.prol, align 8
  %mul42.us.prol = fmul double %7, %8
  %sub47.us.prol = fsub double %.pre14, %mul42.us.prol
  store double %sub47.us.prol, double* %arrayidx46.us, align 8
  br label %for.body33.us.prol.loopexit

for.body33.us.prol.loopexit:                      ; preds = %for.body33.us.prol, %for.cond31.preheader.us
  %indvars.iv26.unr.ph = phi i64 [ 1, %for.body33.us.prol ], [ 0, %for.cond31.preheader.us ]
  %.unr33.ph = phi double [ %sub47.us.prol, %for.body33.us.prol ], [ %.pre14, %for.cond31.preheader.us ]
  br i1 %6, label %for.cond31.for.inc51_crit_edge.us, label %for.body33.us.preheader

for.body33.us.preheader:                          ; preds = %for.body33.us.prol.loopexit
  br label %for.body33.us

for.body33.us:                                    ; preds = %for.body33.us.preheader, %for.body33.us
  %indvars.iv26 = phi i64 [ %indvars.iv.next27.1, %for.body33.us ], [ %indvars.iv26.unr.ph, %for.body33.us.preheader ]
  %9 = phi double [ %sub47.us.1, %for.body33.us ], [ %.unr33.ph, %for.body33.us.preheader ]
  %arrayidx37.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv42, i64 %indvars.iv26
  %10 = load double, double* %arrayidx37.us, align 8
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv26, i64 %indvars.iv36
  %11 = load double, double* %arrayidx41.us, align 8
  %mul42.us = fmul double %10, %11
  %sub47.us = fsub double %9, %mul42.us
  store double %sub47.us, double* %arrayidx46.us, align 8
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %arrayidx37.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv42, i64 %indvars.iv.next27
  %12 = load double, double* %arrayidx37.us.1, align 8
  %arrayidx41.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next27, i64 %indvars.iv36
  %13 = load double, double* %arrayidx41.us.1, align 8
  %mul42.us.1 = fmul double %12, %13
  %sub47.us.1 = fsub double %sub47.us, %mul42.us.1
  store double %sub47.us.1, double* %arrayidx46.us, align 8
  %indvars.iv.next27.1 = add nsw i64 %indvars.iv26, 2
  %exitcond30.1 = icmp eq i64 %indvars.iv.next27.1, %indvars.iv42
  br i1 %exitcond30.1, label %for.cond31.for.inc51_crit_edge.us.loopexit, label %for.body33.us

for.cond31.for.inc51_crit_edge.us.loopexit:       ; preds = %for.body33.us
  br label %for.cond31.for.inc51_crit_edge.us

for.cond31.for.inc51_crit_edge.us:                ; preds = %for.cond31.for.inc51_crit_edge.us.loopexit, %for.body33.us.prol.loopexit
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next37, %0
  br i1 %exitcond46, label %for.inc54.loopexit, label %for.cond31.preheader.us

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.end
  %indvars.iv20 = phi i64 [ %indvars.iv.next21, %for.end ], [ 0, %for.cond4.preheader.preheader ]
  %14 = add i64 %indvars.iv20, 4294967295
  %cmp51 = icmp sgt i64 %indvars.iv20, 0
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv42, i64 %indvars.iv20
  %.pre = load double, double* %arrayidx16, align 8
  br i1 %cmp51, label %for.body6.lr.ph, label %for.end

for.body6.lr.ph:                                  ; preds = %for.cond4.preheader
  %xtraiter49 = and i64 %indvars.iv20, 1
  %lcmp.mod = icmp eq i64 %xtraiter49, 0
  br i1 %lcmp.mod, label %for.body6.prol.loopexit, label %for.body6.prol

for.body6.prol:                                   ; preds = %for.body6.lr.ph
  %15 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv20
  %16 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %15, %16
  %sub.prol = fsub double %.pre, %mul.prol
  store double %sub.prol, double* %arrayidx16, align 8
  br label %for.body6.prol.loopexit

for.body6.prol.loopexit:                          ; preds = %for.body6.prol, %for.body6.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body6.prol ], [ 0, %for.body6.lr.ph ]
  %.unr.ph = phi double [ %sub.prol, %for.body6.prol ], [ %.pre, %for.body6.lr.ph ]
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.body6.prol ], [ undef, %for.body6.lr.ph ]
  %17 = trunc i64 %14 to i32
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %for.end, label %for.body6.preheader

for.body6.preheader:                              ; preds = %for.body6.prol.loopexit
  br label %for.body6

for.body6:                                        ; preds = %for.body6.preheader, %for.body6
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body6 ], [ %indvars.iv.unr.ph, %for.body6.preheader ]
  %19 = phi double [ %sub.1, %for.body6 ], [ %.unr.ph, %for.body6.preheader ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv42, i64 %indvars.iv
  %20 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv20
  %21 = load double, double* %arrayidx12, align 8
  %mul = fmul double %20, %21
  %sub = fsub double %19, %mul
  store double %sub, double* %arrayidx16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv42, i64 %indvars.iv.next
  %22 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv20
  %23 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %22, %23
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv20
  br i1 %exitcond.1, label %for.end.loopexit, label %for.body6

for.end.loopexit:                                 ; preds = %for.body6
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.cond4.preheader, %for.body6.prol.loopexit
  %24 = phi double [ %sub.lcssa.unr.ph, %for.body6.prol.loopexit ], [ %.pre, %for.cond4.preheader ], [ %sub.1, %for.end.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv20, i64 %indvars.iv20
  %25 = load double, double* %arrayidx20, align 8
  %div = fdiv double %24, %25
  store double %div, double* %arrayidx16, align 8
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond = icmp eq i64 %indvars.iv.next21, %indvars.iv42
  br i1 %exitcond, label %for.cond31.preheader.lr.ph, label %for.cond4.preheader

for.inc54.loopexit:                               ; preds = %for.cond31.for.inc51_crit_edge.us
  br label %for.inc54

for.inc54:                                        ; preds = %for.inc54.loopexit, %for.cond1.preheader, %for.cond31.preheader.lr.ph
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next43, %1
  br i1 %exitcond47, label %for.end56.loopexit, label %for.cond1.preheader

for.end56.loopexit:                               ; preds = %for.inc54
  br label %for.end56

for.end56:                                        ; preds = %for.end56.loopexit, %entry
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
  %cmp4 = icmp sgt i32 %n, 0
  br i1 %cmp4, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %n to i64
  %4 = zext i32 %n to i64
  %5 = zext i32 %n to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv7 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next8, %for.cond2.for.inc10_crit_edge.us ]
  %6 = mul nsw i64 %indvars.iv7, %3
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
  %arrayidx8.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv7, i64 %indvars.iv
  %11 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %11) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next, %4
  br i1 %exitcond12, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond = icmp eq i64 %indvars.iv.next8, %5
  br i1 %exitcond, label %for.end12.loopexit, label %for.cond2.preheader.us

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
