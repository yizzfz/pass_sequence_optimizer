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
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %7 = bitcast i8* %3 to [2000 x double]*
  %8 = bitcast i8* %4 to double*
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_ludcmp(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array(i32 2000, double* %9)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]*, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  %6 = alloca i32, align 4
  %7 = alloca [2000 x double]*, align 8
  %8 = alloca [2000 x [2000 x double]]*, align 8
  store i32 %0, i32* %6, align 4
  store [2000 x double]* %1, [2000 x double]** %7, align 8
  %9 = sitofp i32 %0 to double
  %10 = icmp sgt i32 %0, 0
  br i1 %10, label %.lr.ph58, label %.preheader15.thread

.lr.ph58:                                         ; preds = %5
  %11 = sext i32 %0 to i64
  %xtraiter141 = and i64 %11, 1
  %lcmp.mod142 = icmp eq i64 %xtraiter141, 0
  br i1 %lcmp.mod142, label %.prol.loopexit140, label %.prol.preheader139

.prol.preheader139:                               ; preds = %.lr.ph58
  br label %12

; <label>:12:                                     ; preds = %.prol.preheader139
  store double 0.000000e+00, double* %3, align 8
  store double 0.000000e+00, double* %4, align 8
  %13 = fdiv double 1.000000e+00, %9
  %14 = fmul double %13, 5.000000e-01
  %15 = fadd double %14, 4.000000e+00
  store double %15, double* %2, align 8
  br label %.prol.loopexit140

.prol.loopexit140:                                ; preds = %.lr.ph58, %12
  %indvars.iv129.unr = phi i64 [ 0, %.lr.ph58 ], [ 1, %12 ]
  %16 = icmp eq i32 %0, 1
  br i1 %16, label %.preheader14.lr.ph, label %.lr.ph58.new

.lr.ph58.new:                                     ; preds = %.prol.loopexit140
  br label %19

.preheader14.lr.ph.unr-lcssa:                     ; preds = %19
  br label %.preheader14.lr.ph

.preheader14.lr.ph:                               ; preds = %.prol.loopexit140, %.preheader14.lr.ph.unr-lcssa
  %17 = add i32 %0, 7
  %18 = add i32 %0, -2
  br label %.preheader14

; <label>:19:                                     ; preds = %19, %.lr.ph58.new
  %indvars.iv129 = phi i64 [ %indvars.iv129.unr, %.lr.ph58.new ], [ %indvars.iv.next130.1, %19 ]
  %sext = shl i64 %indvars.iv129, 32
  %20 = ashr exact i64 %sext, 32
  %21 = getelementptr inbounds double, double* %3, i64 %20
  store double 0.000000e+00, double* %21, align 8
  %22 = getelementptr inbounds double, double* %4, i64 %20
  store double 0.000000e+00, double* %22, align 8
  %indvars.iv.next130 = add nuw nsw i64 %indvars.iv129, 1
  %23 = trunc i64 %indvars.iv.next130 to i32
  %24 = sitofp i32 %23 to double
  %25 = fdiv double %24, %9
  %26 = fmul double %25, 5.000000e-01
  %27 = fadd double %26, 4.000000e+00
  %28 = getelementptr inbounds double, double* %2, i64 %indvars.iv129
  store double %27, double* %28, align 8
  %sext.1 = shl i64 %indvars.iv.next130, 32
  %29 = ashr exact i64 %sext.1, 32
  %30 = getelementptr inbounds double, double* %3, i64 %29
  store double 0.000000e+00, double* %30, align 8
  %31 = getelementptr inbounds double, double* %4, i64 %29
  store double 0.000000e+00, double* %31, align 8
  %indvars.iv.next130.1 = add nsw i64 %indvars.iv129, 2
  %32 = trunc i64 %indvars.iv.next130.1 to i32
  %33 = sitofp i32 %32 to double
  %34 = fdiv double %33, %9
  %35 = fmul double %34, 5.000000e-01
  %36 = fadd double %35, 4.000000e+00
  %37 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next130
  store double %36, double* %37, align 8
  %38 = icmp slt i64 %indvars.iv.next130.1, %11
  br i1 %38, label %19, label %.preheader14.lr.ph.unr-lcssa

.preheader14:                                     ; preds = %.preheader14.lr.ph, %._crit_edge49
  %indvars.iv125 = phi i64 [ 0, %.preheader14.lr.ph ], [ %indvars.iv.next126, %._crit_edge49 ]
  %indvar116 = phi i32 [ 0, %.preheader14.lr.ph ], [ %indvar.next117, %._crit_edge49 ]
  %indvars.iv110 = phi i64 [ 1, %.preheader14.lr.ph ], [ %indvars.iv.next111, %._crit_edge49 ]
  %indvars.iv106 = phi i32 [ 1, %.preheader14.lr.ph ], [ %indvars.iv.next107, %._crit_edge49 ]
  %39 = sub i32 %17, %indvar116
  %40 = sub i32 %18, %indvar116
  %41 = icmp slt i64 %indvars.iv125, 0
  br i1 %41, label %.preheader13, label %.lr.ph45

.lr.ph45:                                         ; preds = %.preheader14
  %wide.trip.count108 = zext i32 %indvars.iv106 to i64
  br label %45

.preheader13.loopexit:                            ; preds = %45
  br label %.preheader13

.preheader13:                                     ; preds = %.preheader13.loopexit, %.preheader14
  %indvars.iv.next126 = add nsw i64 %indvars.iv125, 1
  %42 = icmp slt i64 %indvars.iv.next126, %11
  br i1 %42, label %.lr.ph48, label %._crit_edge49

.lr.ph48:                                         ; preds = %.preheader13
  %xtraiter118 = and i32 %39, 7
  %lcmp.mod119 = icmp eq i32 %xtraiter118, 0
  br i1 %lcmp.mod119, label %.prol.loopexit115, label %.prol.preheader114.preheader

.prol.preheader114.preheader:                     ; preds = %.lr.ph48
  br label %.prol.preheader114

.prol.preheader114:                               ; preds = %.prol.preheader114.preheader, %.prol.preheader114
  %indvars.iv112.prol = phi i64 [ %indvars.iv.next113.prol, %.prol.preheader114 ], [ %indvars.iv110, %.prol.preheader114.preheader ]
  %prol.iter121 = phi i32 [ %prol.iter121.sub, %.prol.preheader114 ], [ %xtraiter118, %.prol.preheader114.preheader ]
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv125, i64 %indvars.iv112.prol
  store double 0.000000e+00, double* %43, align 8
  %indvars.iv.next113.prol = add nsw i64 %indvars.iv112.prol, 1
  %prol.iter121.sub = add i32 %prol.iter121, -1
  %prol.iter121.cmp = icmp eq i32 %prol.iter121.sub, 0
  br i1 %prol.iter121.cmp, label %.prol.loopexit115.loopexit, label %.prol.preheader114, !llvm.loop !1

.prol.loopexit115.loopexit:                       ; preds = %.prol.preheader114
  br label %.prol.loopexit115

.prol.loopexit115:                                ; preds = %.prol.loopexit115.loopexit, %.lr.ph48
  %indvars.iv112.unr = phi i64 [ %indvars.iv110, %.lr.ph48 ], [ %indvars.iv.next113.prol, %.prol.loopexit115.loopexit ]
  %44 = icmp ult i32 %40, 7
  br i1 %44, label %._crit_edge49, label %.lr.ph48.new.preheader

.lr.ph48.new.preheader:                           ; preds = %.prol.loopexit115
  br label %.lr.ph48.new

; <label>:45:                                     ; preds = %45, %.lr.ph45
  %indvars.iv101 = phi i64 [ %indvars.iv.next102, %45 ], [ 0, %.lr.ph45 ]
  %46 = sub nsw i64 0, %indvars.iv101
  %47 = trunc i64 %46 to i32
  %48 = srem i32 %47, %0
  %49 = sitofp i32 %48 to double
  %50 = fdiv double %49, %9
  %51 = fadd double %50, 1.000000e+00
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv125, i64 %indvars.iv101
  store double %51, double* %52, align 8
  %indvars.iv.next102 = add nuw nsw i64 %indvars.iv101, 1
  %exitcond109 = icmp eq i64 %indvars.iv.next102, %wide.trip.count108
  br i1 %exitcond109, label %.preheader13.loopexit, label %45

.lr.ph48.new:                                     ; preds = %.lr.ph48.new.preheader, %.lr.ph48.new
  %indvars.iv112 = phi i64 [ %indvars.iv.next113.7, %.lr.ph48.new ], [ %indvars.iv112.unr, %.lr.ph48.new.preheader ]
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv125, i64 %indvars.iv112
  store double 0.000000e+00, double* %53, align 8
  %indvars.iv.next113 = add nsw i64 %indvars.iv112, 1
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv125, i64 %indvars.iv.next113
  store double 0.000000e+00, double* %54, align 8
  %indvars.iv.next113.1 = add nsw i64 %indvars.iv112, 2
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv125, i64 %indvars.iv.next113.1
  store double 0.000000e+00, double* %55, align 8
  %indvars.iv.next113.2 = add nsw i64 %indvars.iv112, 3
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv125, i64 %indvars.iv.next113.2
  store double 0.000000e+00, double* %56, align 8
  %indvars.iv.next113.3 = add nsw i64 %indvars.iv112, 4
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv125, i64 %indvars.iv.next113.3
  store double 0.000000e+00, double* %57, align 8
  %indvars.iv.next113.4 = add nsw i64 %indvars.iv112, 5
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv125, i64 %indvars.iv.next113.4
  store double 0.000000e+00, double* %58, align 8
  %indvars.iv.next113.5 = add nsw i64 %indvars.iv112, 6
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv125, i64 %indvars.iv.next113.5
  store double 0.000000e+00, double* %59, align 8
  %indvars.iv.next113.6 = add nsw i64 %indvars.iv112, 7
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv125, i64 %indvars.iv.next113.6
  store double 0.000000e+00, double* %60, align 8
  %indvars.iv.next113.7 = add nsw i64 %indvars.iv112, 8
  %lftr.wideiv.7 = trunc i64 %indvars.iv.next113.7 to i32
  %exitcond.7 = icmp eq i32 %lftr.wideiv.7, %0
  br i1 %exitcond.7, label %._crit_edge49.loopexit, label %.lr.ph48.new

._crit_edge49.loopexit:                           ; preds = %.lr.ph48.new
  br label %._crit_edge49

._crit_edge49:                                    ; preds = %._crit_edge49.loopexit, %.prol.loopexit115, %.preheader13
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv125, i64 %indvars.iv125
  store double 1.000000e+00, double* %61, align 8
  %indvars.iv.next107 = add i32 %indvars.iv106, 1
  %indvars.iv.next111 = add nsw i64 %indvars.iv110, 1
  %indvar.next117 = add i32 %indvar116, 1
  br i1 %42, label %.preheader14, label %.preheader15.thread.loopexit

.preheader15.thread.loopexit:                     ; preds = %._crit_edge49
  br label %.preheader15.thread

.preheader15.thread:                              ; preds = %.preheader15.thread.loopexit, %5
  %62 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %63 = bitcast [2000 x [2000 x double]]** %8 to i8**
  store i8* %62, i8** %63, align 8
  %64 = bitcast i8* %62 to [2000 x [2000 x double]]*
  br i1 %10, label %.preheader12.us.preheader, label %._crit_edge1.preheader

.preheader12.us.preheader:                        ; preds = %.preheader15.thread
  %65 = add i32 %0, -1
  %66 = zext i32 %65 to i64
  %67 = shl nuw nsw i64 %66, 3
  %68 = add nuw nsw i64 %67, 8
  %69 = sext i32 %0 to i64
  %70 = add nsw i64 %69, -1
  %xtraiter136 = and i64 %69, 3
  %lcmp.mod137 = icmp eq i64 %xtraiter136, 0
  br i1 %lcmp.mod137, label %._crit_edge41.us.prol.loopexit, label %._crit_edge41.us.prol.preheader

._crit_edge41.us.prol.preheader:                  ; preds = %.preheader12.us.preheader
  br label %._crit_edge41.us.prol

._crit_edge41.us.prol:                            ; preds = %._crit_edge41.us.prol, %._crit_edge41.us.prol.preheader
  %indvars.iv96.prol = phi i64 [ 0, %._crit_edge41.us.prol.preheader ], [ %indvars.iv.next97.prol, %._crit_edge41.us.prol ]
  %indvar.prol = phi i64 [ 0, %._crit_edge41.us.prol.preheader ], [ %indvar.next.prol, %._crit_edge41.us.prol ]
  %prol.iter138 = phi i64 [ %xtraiter136, %._crit_edge41.us.prol.preheader ], [ %prol.iter138.sub, %._crit_edge41.us.prol ]
  %scevgep.prol = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %64, i64 0, i64 %indvar.prol, i64 0
  %scevgep95.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep95.prol, i8 0, i64 %68, i32 8, i1 false)
  %indvars.iv.next97.prol = add nsw i64 %indvars.iv96.prol, 1
  %indvar.next.prol = add nuw nsw i64 %indvar.prol, 1
  %prol.iter138.sub = add i64 %prol.iter138, -1
  %prol.iter138.cmp = icmp eq i64 %prol.iter138.sub, 0
  br i1 %prol.iter138.cmp, label %._crit_edge41.us.prol.loopexit.unr-lcssa, label %._crit_edge41.us.prol, !llvm.loop !3

._crit_edge41.us.prol.loopexit.unr-lcssa:         ; preds = %._crit_edge41.us.prol
  br label %._crit_edge41.us.prol.loopexit

._crit_edge41.us.prol.loopexit:                   ; preds = %.preheader12.us.preheader, %._crit_edge41.us.prol.loopexit.unr-lcssa
  %indvars.iv96.unr = phi i64 [ 0, %.preheader12.us.preheader ], [ %indvars.iv.next97.prol, %._crit_edge41.us.prol.loopexit.unr-lcssa ]
  %indvar.unr = phi i64 [ 0, %.preheader12.us.preheader ], [ %indvar.next.prol, %._crit_edge41.us.prol.loopexit.unr-lcssa ]
  %71 = icmp ult i64 %70, 3
  br i1 %71, label %.preheader11.loopexit, label %.preheader12.us.preheader.new

.preheader12.us.preheader.new:                    ; preds = %._crit_edge41.us.prol.loopexit
  br label %._crit_edge41.us

._crit_edge41.us:                                 ; preds = %._crit_edge41.us, %.preheader12.us.preheader.new
  %indvars.iv96 = phi i64 [ %indvars.iv96.unr, %.preheader12.us.preheader.new ], [ %indvars.iv.next97.3, %._crit_edge41.us ]
  %indvar = phi i64 [ %indvar.unr, %.preheader12.us.preheader.new ], [ %indvar.next.3, %._crit_edge41.us ]
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %64, i64 0, i64 %indvar, i64 0
  %scevgep95 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep95, i8 0, i64 %68, i32 8, i1 false)
  %indvar.next = add nuw nsw i64 %indvar, 1
  %scevgep.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %64, i64 0, i64 %indvar.next, i64 0
  %scevgep95.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep95.1, i8 0, i64 %68, i32 8, i1 false)
  %indvar.next.1 = add nsw i64 %indvar, 2
  %scevgep.2 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %64, i64 0, i64 %indvar.next.1, i64 0
  %scevgep95.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep95.2, i8 0, i64 %68, i32 8, i1 false)
  %indvar.next.2 = add nsw i64 %indvar, 3
  %scevgep.3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %64, i64 0, i64 %indvar.next.2, i64 0
  %scevgep95.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep95.3, i8 0, i64 %68, i32 8, i1 false)
  %indvars.iv.next97.3 = add nsw i64 %indvars.iv96, 4
  %72 = icmp slt i64 %indvars.iv.next97.3, %69
  %indvar.next.3 = add nsw i64 %indvar, 4
  br i1 %72, label %._crit_edge41.us, label %.preheader11.loopexit.unr-lcssa

.preheader11.loopexit.unr-lcssa:                  ; preds = %._crit_edge41.us
  br label %.preheader11.loopexit

.preheader11.loopexit:                            ; preds = %._crit_edge41.us.prol.loopexit, %.preheader11.loopexit.unr-lcssa
  %.pr133.pre = load i32, i32* %6, align 4
  %73 = icmp sgt i32 %.pr133.pre, 0
  br i1 %73, label %._crit_edge.preheader.lr.ph, label %._crit_edge1.preheader

._crit_edge.preheader.lr.ph:                      ; preds = %.preheader11.loopexit
  %74 = load [2000 x double]*, [2000 x double]** %7, align 8
  %75 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %8, align 8
  %76 = sext i32 %.pr133.pre to i64
  %xtraiter79 = and i32 %.pr133.pre, 1
  %lcmp.mod80 = icmp eq i32 %xtraiter79, 0
  %77 = icmp eq i32 %.pr133.pre, 1
  %wide.trip.count76.1 = zext i32 %.pr133.pre to i64
  br label %._crit_edge.preheader.us

._crit_edge.preheader.us:                         ; preds = %._crit_edge.preheader.lr.ph, %._crit_edge._crit_edge.us-lcssa.us.us
  %indvars.iv87 = phi i64 [ 0, %._crit_edge.preheader.lr.ph ], [ %indvars.iv.next88, %._crit_edge._crit_edge.us-lcssa.us.us ]
  %78 = getelementptr inbounds [2000 x double], [2000 x double]* %74, i64 0, i64 %indvars.iv87
  br label %.preheader10.us.us

._crit_edge._crit_edge.us-lcssa.us.us:            ; preds = %._crit_edge24.us.us
  %indvars.iv.next88 = add nsw i64 %indvars.iv87, 1
  %79 = icmp slt i64 %indvars.iv.next88, %76
  br i1 %79, label %._crit_edge.preheader.us, label %._crit_edge1.preheader.loopexit

.preheader10.us.us:                               ; preds = %._crit_edge24.us.us, %._crit_edge.preheader.us
  %indvars.iv82 = phi i64 [ 0, %._crit_edge.preheader.us ], [ %indvars.iv.next83, %._crit_edge24.us.us ]
  %80 = getelementptr inbounds [2000 x double], [2000 x double]* %74, i64 %indvars.iv82, i64 %indvars.iv87
  br i1 %lcmp.mod80, label %.prol.loopexit78, label %.prol.preheader77

.prol.preheader77:                                ; preds = %.preheader10.us.us
  %81 = load double, double* %80, align 8
  %82 = load double, double* %78, align 8
  %83 = fmul double %81, %82
  %84 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %75, i64 0, i64 %indvars.iv82, i64 0
  %85 = load double, double* %84, align 8
  %86 = fadd double %83, %85
  store double %86, double* %84, align 8
  br label %.prol.loopexit78

.prol.loopexit78:                                 ; preds = %.prol.preheader77, %.preheader10.us.us
  %indvars.iv74.unr.ph = phi i64 [ 1, %.prol.preheader77 ], [ 0, %.preheader10.us.us ]
  br i1 %77, label %._crit_edge24.us.us, label %.preheader10.us.us.new.preheader

.preheader10.us.us.new.preheader:                 ; preds = %.prol.loopexit78
  br label %.preheader10.us.us.new

._crit_edge24.us.us.loopexit:                     ; preds = %.preheader10.us.us.new
  br label %._crit_edge24.us.us

._crit_edge24.us.us:                              ; preds = %._crit_edge24.us.us.loopexit, %.prol.loopexit78
  %indvars.iv.next83 = add nsw i64 %indvars.iv82, 1
  %exitcond86 = icmp eq i64 %indvars.iv.next83, %76
  br i1 %exitcond86, label %._crit_edge._crit_edge.us-lcssa.us.us, label %.preheader10.us.us

.preheader10.us.us.new:                           ; preds = %.preheader10.us.us.new.preheader, %.preheader10.us.us.new
  %indvars.iv74 = phi i64 [ %indvars.iv.next75.1, %.preheader10.us.us.new ], [ %indvars.iv74.unr.ph, %.preheader10.us.us.new.preheader ]
  %87 = load double, double* %80, align 8
  %88 = getelementptr inbounds [2000 x double], [2000 x double]* %74, i64 %indvars.iv74, i64 %indvars.iv87
  %89 = load double, double* %88, align 8
  %90 = fmul double %87, %89
  %91 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %75, i64 0, i64 %indvars.iv82, i64 %indvars.iv74
  %92 = load double, double* %91, align 8
  %93 = fadd double %90, %92
  store double %93, double* %91, align 8
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %94 = load double, double* %80, align 8
  %95 = getelementptr inbounds [2000 x double], [2000 x double]* %74, i64 %indvars.iv.next75, i64 %indvars.iv87
  %96 = load double, double* %95, align 8
  %97 = fmul double %94, %96
  %98 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %75, i64 0, i64 %indvars.iv82, i64 %indvars.iv.next75
  %99 = load double, double* %98, align 8
  %100 = fadd double %97, %99
  store double %100, double* %98, align 8
  %indvars.iv.next75.1 = add nsw i64 %indvars.iv74, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next75.1, %wide.trip.count76.1
  br i1 %exitcond.1, label %._crit_edge24.us.us.loopexit, label %.preheader10.us.us.new

._crit_edge1.preheader.loopexit:                  ; preds = %._crit_edge._crit_edge.us-lcssa.us.us
  br label %._crit_edge1.preheader

._crit_edge1.preheader:                           ; preds = %._crit_edge1.preheader.loopexit, %.preheader15.thread, %.preheader11.loopexit
  %101 = phi i32 [ %.pr133.pre, %.preheader11.loopexit ], [ %0, %.preheader15.thread ], [ %.pr133.pre, %._crit_edge1.preheader.loopexit ]
  %102 = icmp sgt i32 %101, 0
  br i1 %102, label %.preheader.lr.ph, label %._crit_edge1.preheader._crit_edge

._crit_edge1.preheader._crit_edge:                ; preds = %._crit_edge1.preheader
  %.pre135 = load i8*, i8** %63, align 8
  br label %._crit_edge1._crit_edge

.preheader.lr.ph:                                 ; preds = %._crit_edge1.preheader
  %103 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %8, align 8
  %104 = load [2000 x double]*, [2000 x double]** %7, align 8
  %105 = bitcast [2000 x [2000 x double]]* %103 to i8*
  %106 = add i32 %101, -1
  %107 = sext i32 %101 to i64
  %xtraiter = and i32 %101, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %108 = icmp ult i32 %106, 3
  %wide.trip.count.3 = zext i32 %101 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.lr.ph, %._crit_edge20.us
  %indvars.iv72 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next73, %._crit_edge20.us ]
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.preheader.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %109 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %103, i64 0, i64 %indvars.iv72, i64 %indvars.iv.prol
  %110 = bitcast double* %109 to i64*
  %111 = load i64, i64* %110, align 8
  %112 = getelementptr inbounds [2000 x double], [2000 x double]* %104, i64 %indvars.iv72, i64 %indvars.iv.prol
  %113 = bitcast double* %112 to i64*
  store i64 %111, i64* %113, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !4

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.preheader.us
  %indvars.iv.unr = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  br i1 %108, label %._crit_edge20.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader.us.new ], [ %indvars.iv.unr, %.preheader.us.new.preheader ]
  %114 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %103, i64 0, i64 %indvars.iv72, i64 %indvars.iv
  %115 = bitcast double* %114 to i64*
  %116 = load i64, i64* %115, align 8
  %117 = getelementptr inbounds [2000 x double], [2000 x double]* %104, i64 %indvars.iv72, i64 %indvars.iv
  %118 = bitcast double* %117 to i64*
  store i64 %116, i64* %118, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %119 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %103, i64 0, i64 %indvars.iv72, i64 %indvars.iv.next
  %120 = bitcast double* %119 to i64*
  %121 = load i64, i64* %120, align 8
  %122 = getelementptr inbounds [2000 x double], [2000 x double]* %104, i64 %indvars.iv72, i64 %indvars.iv.next
  %123 = bitcast double* %122 to i64*
  store i64 %121, i64* %123, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %124 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %103, i64 0, i64 %indvars.iv72, i64 %indvars.iv.next.1
  %125 = bitcast double* %124 to i64*
  %126 = load i64, i64* %125, align 8
  %127 = getelementptr inbounds [2000 x double], [2000 x double]* %104, i64 %indvars.iv72, i64 %indvars.iv.next.1
  %128 = bitcast double* %127 to i64*
  store i64 %126, i64* %128, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %129 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %103, i64 0, i64 %indvars.iv72, i64 %indvars.iv.next.2
  %130 = bitcast double* %129 to i64*
  %131 = load i64, i64* %130, align 8
  %132 = getelementptr inbounds [2000 x double], [2000 x double]* %104, i64 %indvars.iv72, i64 %indvars.iv.next.2
  %133 = bitcast double* %132 to i64*
  store i64 %131, i64* %133, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %._crit_edge20.us.loopexit, label %.preheader.us.new

._crit_edge20.us.loopexit:                        ; preds = %.preheader.us.new
  br label %._crit_edge20.us

._crit_edge20.us:                                 ; preds = %._crit_edge20.us.loopexit, %.prol.loopexit
  %indvars.iv.next73 = add nsw i64 %indvars.iv72, 1
  %134 = icmp slt i64 %indvars.iv.next73, %107
  br i1 %134, label %.preheader.us, label %._crit_edge1._crit_edge.loopexit

._crit_edge1._crit_edge.loopexit:                 ; preds = %._crit_edge20.us
  br label %._crit_edge1._crit_edge

._crit_edge1._crit_edge:                          ; preds = %._crit_edge1._crit_edge.loopexit, %._crit_edge1.preheader._crit_edge
  %135 = phi i8* [ %.pre135, %._crit_edge1.preheader._crit_edge ], [ %105, %._crit_edge1._crit_edge.loopexit ]
  tail call void @free(i8* %135) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32, [2000 x double]*, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader11.lr.ph, label %.preheader.thread

.preheader11.lr.ph:                               ; preds = %5
  %7 = zext i32 %0 to i64
  %8 = add i32 %0, -1
  %9 = zext i32 %8 to i64
  %10 = sext i32 %0 to i64
  br label %.preheader11

.preheader11:                                     ; preds = %.preheader11.lr.ph, %._crit_edge71
  %indvars.iv169 = phi i64 [ 0, %.preheader11.lr.ph ], [ %indvars.iv.next170, %._crit_edge71 ]
  %indvars.iv166 = phi i32 [ 0, %.preheader11.lr.ph ], [ %indvars.iv.next167, %._crit_edge71 ]
  %indvar141 = phi i64 [ 0, %.preheader11.lr.ph ], [ %indvar.next142, %._crit_edge71 ]
  %11 = add nuw nsw i64 %indvar141, 4294967295
  %12 = trunc i64 %11 to i32
  %13 = sub i64 %7, %indvar141
  %14 = sub i64 %9, %indvar141
  %15 = trunc i64 %14 to i32
  %16 = icmp sgt i64 %indvars.iv169, 0
  br i1 %16, label %.lr.ph54.preheader, label %.preheader10

.lr.ph54.preheader:                               ; preds = %.preheader11
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv169, i64 0
  %wide.trip.count134 = zext i32 %indvars.iv166 to i64
  br label %.lr.ph54

.preheader9:                                      ; preds = %._crit_edge71
  br i1 %6, label %.lr.ph38, label %.preheader.thread

.lr.ph38:                                         ; preds = %.preheader9
  %18 = sext i32 %0 to i64
  br label %77

.preheader10.loopexit:                            ; preds = %._crit_edge47
  br label %.preheader10

.preheader10:                                     ; preds = %.preheader10.loopexit, %.preheader11
  %19 = icmp slt i64 %indvars.iv169, %10
  br i1 %19, label %.lr.ph70, label %._crit_edge71

.lr.ph70:                                         ; preds = %.preheader10
  br i1 %16, label %.lr.ph70.split.us.preheader, label %.lr.ph70.split.preheader

.lr.ph70.split.us.preheader:                      ; preds = %.lr.ph70
  %xtraiter157172 = and i64 %indvar141, 1
  %lcmp.mod158 = icmp eq i64 %xtraiter157172, 0
  %20 = icmp eq i32 %12, 0
  %wide.trip.count154.1 = zext i32 %indvars.iv166 to i64
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv169, i64 0
  br label %.lr.ph70.split.us

.lr.ph70.split.preheader:                         ; preds = %.lr.ph70
  %22 = icmp eq i32 %15, 0
  br i1 %22, label %._crit_edge71, label %.lr.ph70.split.preheader198

.lr.ph70.split.preheader198:                      ; preds = %.lr.ph70.split.preheader
  %xtraiter144171 = and i64 %13, 1
  %indvars.iv169.indvars.iv.next139.prol = add nsw i64 %indvars.iv169, %xtraiter144171
  br label %.lr.ph70.split

.lr.ph70.split.us:                                ; preds = %.lr.ph70.split.us.preheader, %._crit_edge63.us
  %indvars.iv164 = phi i64 [ %indvars.iv.next165, %._crit_edge63.us ], [ %indvars.iv169, %.lr.ph70.split.us.preheader ]
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv169, i64 %indvars.iv164
  %24 = load double, double* %23, align 8
  br i1 %lcmp.mod158, label %.prol.loopexit156, label %.prol.preheader155

.prol.preheader155:                               ; preds = %.lr.ph70.split.us
  %25 = load double, double* %21, align 8
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv164
  %27 = load double, double* %26, align 8
  %28 = fmul double %25, %27
  %29 = fsub double %24, %28
  br label %.prol.loopexit156

.prol.loopexit156:                                ; preds = %.prol.preheader155, %.lr.ph70.split.us
  %indvars.iv148.unr.ph = phi i64 [ 1, %.prol.preheader155 ], [ 0, %.lr.ph70.split.us ]
  %.unr160.ph = phi double [ %29, %.prol.preheader155 ], [ %24, %.lr.ph70.split.us ]
  %.lcssa90.unr.ph = phi double [ %29, %.prol.preheader155 ], [ undef, %.lr.ph70.split.us ]
  br i1 %20, label %._crit_edge63.us, label %.lr.ph70.split.us.new.preheader

.lr.ph70.split.us.new.preheader:                  ; preds = %.prol.loopexit156
  br label %.lr.ph70.split.us.new

.lr.ph70.split.us.new:                            ; preds = %.lr.ph70.split.us.new.preheader, %.lr.ph70.split.us.new
  %indvars.iv148 = phi i64 [ %indvars.iv.next149.1, %.lr.ph70.split.us.new ], [ %indvars.iv148.unr.ph, %.lr.ph70.split.us.new.preheader ]
  %30 = phi double [ %44, %.lr.ph70.split.us.new ], [ %.unr160.ph, %.lr.ph70.split.us.new.preheader ]
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv169, i64 %indvars.iv148
  %32 = bitcast double* %31 to <2 x double>*
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv148, i64 %indvars.iv164
  %34 = load double, double* %33, align 8
  %indvars.iv.next149 = add nuw nsw i64 %indvars.iv148, 1
  %35 = load <2 x double>, <2 x double>* %32, align 8
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next149, i64 %indvars.iv164
  %37 = load double, double* %36, align 8
  %38 = insertelement <2 x double> undef, double %34, i32 0
  %39 = insertelement <2 x double> %38, double %37, i32 1
  %40 = fmul <2 x double> %35, %39
  %41 = extractelement <2 x double> %40, i32 0
  %42 = extractelement <2 x double> %40, i32 1
  %43 = fsub double %30, %41
  %44 = fsub double %43, %42
  %indvars.iv.next149.1 = add nsw i64 %indvars.iv148, 2
  %exitcond.1161 = icmp eq i64 %indvars.iv.next149.1, %wide.trip.count154.1
  br i1 %exitcond.1161, label %._crit_edge63.us.loopexit, label %.lr.ph70.split.us.new

._crit_edge63.us.loopexit:                        ; preds = %.lr.ph70.split.us.new
  br label %._crit_edge63.us

._crit_edge63.us:                                 ; preds = %._crit_edge63.us.loopexit, %.prol.loopexit156
  %.lcssa90 = phi double [ %.lcssa90.unr.ph, %.prol.loopexit156 ], [ %44, %._crit_edge63.us.loopexit ]
  store double %.lcssa90, double* %23, align 8
  %indvars.iv.next165 = add nsw i64 %indvars.iv164, 1
  %lftr.wideiv168 = trunc i64 %indvars.iv.next165 to i32
  %exitcond = icmp eq i32 %lftr.wideiv168, %0
  br i1 %exitcond, label %._crit_edge71.loopexit, label %.lr.ph70.split.us

.lr.ph54:                                         ; preds = %.lr.ph54.preheader, %._crit_edge47
  %indvars.iv127 = phi i64 [ %indvars.iv.next128, %._crit_edge47 ], [ 0, %.lr.ph54.preheader ]
  %45 = add i64 %indvars.iv127, 4294967295
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv169, i64 %indvars.iv127
  %47 = load double, double* %46, align 8
  %48 = icmp sgt i64 %indvars.iv127, 0
  br i1 %48, label %.lr.ph46, label %._crit_edge47

.lr.ph46:                                         ; preds = %.lr.ph54
  %xtraiter120173 = and i64 %indvars.iv127, 1
  %lcmp.mod121 = icmp eq i64 %xtraiter120173, 0
  br i1 %lcmp.mod121, label %.prol.loopexit119, label %.prol.preheader118

.prol.preheader118:                               ; preds = %.lr.ph46
  %49 = load double, double* %17, align 8
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv127
  %51 = load double, double* %50, align 8
  %52 = fmul double %49, %51
  %53 = fsub double %47, %52
  br label %.prol.loopexit119

.prol.loopexit119:                                ; preds = %.prol.preheader118, %.lr.ph46
  %indvars.iv111.unr.ph = phi i64 [ 1, %.prol.preheader118 ], [ 0, %.lr.ph46 ]
  %.unr123.ph = phi double [ %53, %.prol.preheader118 ], [ %47, %.lr.ph46 ]
  %.lcssa88.unr.ph = phi double [ %53, %.prol.preheader118 ], [ undef, %.lr.ph46 ]
  %54 = trunc i64 %45 to i32
  %55 = icmp eq i32 %54, 0
  br i1 %55, label %._crit_edge47, label %.lr.ph46.new.preheader

.lr.ph46.new.preheader:                           ; preds = %.prol.loopexit119
  br label %.lr.ph46.new

.lr.ph46.new:                                     ; preds = %.lr.ph46.new.preheader, %.lr.ph46.new
  %indvars.iv111 = phi i64 [ %indvars.iv.next112.1, %.lr.ph46.new ], [ %indvars.iv111.unr.ph, %.lr.ph46.new.preheader ]
  %56 = phi double [ %70, %.lr.ph46.new ], [ %.unr123.ph, %.lr.ph46.new.preheader ]
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv169, i64 %indvars.iv111
  %58 = bitcast double* %57 to <2 x double>*
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv111, i64 %indvars.iv127
  %60 = load double, double* %59, align 8
  %indvars.iv.next112 = add nuw nsw i64 %indvars.iv111, 1
  %61 = load <2 x double>, <2 x double>* %58, align 8
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next112, i64 %indvars.iv127
  %63 = load double, double* %62, align 8
  %64 = insertelement <2 x double> undef, double %60, i32 0
  %65 = insertelement <2 x double> %64, double %63, i32 1
  %66 = fmul <2 x double> %61, %65
  %67 = extractelement <2 x double> %66, i32 0
  %68 = extractelement <2 x double> %66, i32 1
  %69 = fsub double %56, %67
  %70 = fsub double %69, %68
  %indvars.iv.next112.1 = add nsw i64 %indvars.iv111, 2
  %exitcond.1124 = icmp eq i64 %indvars.iv.next112.1, %indvars.iv127
  br i1 %exitcond.1124, label %._crit_edge47.loopexit, label %.lr.ph46.new

._crit_edge47.loopexit:                           ; preds = %.lr.ph46.new
  br label %._crit_edge47

._crit_edge47:                                    ; preds = %._crit_edge47.loopexit, %.prol.loopexit119, %.lr.ph54
  %71 = phi double [ %47, %.lr.ph54 ], [ %.lcssa88.unr.ph, %.prol.loopexit119 ], [ %70, %._crit_edge47.loopexit ]
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv127, i64 %indvars.iv127
  %73 = load double, double* %72, align 8
  %74 = fdiv double %71, %73
  store double %74, double* %46, align 8
  %indvars.iv.next128 = add nuw nsw i64 %indvars.iv127, 1
  %exitcond135 = icmp eq i64 %indvars.iv.next128, %wide.trip.count134
  br i1 %exitcond135, label %.preheader10.loopexit, label %.lr.ph54

.lr.ph70.split:                                   ; preds = %.lr.ph70.split.preheader198, %.lr.ph70.split
  %indvars.iv138 = phi i64 [ %indvars.iv.next139.1, %.lr.ph70.split ], [ %indvars.iv169.indvars.iv.next139.prol, %.lr.ph70.split.preheader198 ]
  %indvars.iv.next139.1 = add nsw i64 %indvars.iv138, 2
  %lftr.wideiv140.1 = trunc i64 %indvars.iv.next139.1 to i32
  %exitcond.1147 = icmp eq i32 %lftr.wideiv140.1, %0
  br i1 %exitcond.1147, label %._crit_edge71.loopexit199, label %.lr.ph70.split

._crit_edge71.loopexit:                           ; preds = %._crit_edge63.us
  br label %._crit_edge71

._crit_edge71.loopexit199:                        ; preds = %.lr.ph70.split
  br label %._crit_edge71

._crit_edge71:                                    ; preds = %._crit_edge71.loopexit199, %._crit_edge71.loopexit, %.lr.ph70.split.preheader, %.preheader10
  %indvars.iv.next170 = add nsw i64 %indvars.iv169, 1
  %indvars.iv.next167 = add i32 %indvars.iv166, 1
  %75 = icmp slt i64 %indvars.iv.next170, %10
  %indvar.next142 = add nuw nsw i64 %indvar141, 1
  br i1 %75, label %.preheader11, label %.preheader9

.preheader:                                       ; preds = %130
  %storemerge221 = add nsw i32 %0, -1
  %76 = sext i32 %storemerge221 to i64
  br label %135

; <label>:77:                                     ; preds = %.lr.ph38, %130
  %indvars.iv109 = phi i64 [ 0, %.lr.ph38 ], [ %indvars.iv.next110, %130 ]
  %indvar103 = phi i32 [ 0, %.lr.ph38 ], [ %indvar.next104, %130 ]
  %indvars.iv99 = phi i32 [ 0, %.lr.ph38 ], [ %indvars.iv.next100, %130 ]
  %78 = add i64 %indvars.iv109, -2
  %sext = shl i64 %indvars.iv109, 32
  %79 = ashr exact i64 %sext, 32
  %80 = getelementptr inbounds double, double* %2, i64 %79
  %81 = bitcast double* %80 to i64*
  %82 = load i64, i64* %81, align 8
  %83 = icmp sgt i64 %indvars.iv109, 0
  %84 = bitcast i64 %82 to double
  br i1 %83, label %.lr.ph31, label %130

.lr.ph31:                                         ; preds = %77
  %xtraiter105 = and i32 %indvar103, 1
  %lcmp.mod106 = icmp eq i32 %xtraiter105, 0
  br i1 %lcmp.mod106, label %.prol.loopexit102, label %.prol.preheader101

.prol.preheader101:                               ; preds = %.lr.ph31
  %85 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv109, i64 0
  %86 = load double, double* %85, align 8
  %87 = load double, double* %4, align 8
  %88 = fmul double %86, %87
  %89 = fsub double %84, %88
  br label %.prol.loopexit102

.prol.loopexit102:                                ; preds = %.prol.preheader101, %.lr.ph31
  %indvars.iv97.unr.ph = phi i64 [ 1, %.prol.preheader101 ], [ 0, %.lr.ph31 ]
  %.unr108.ph = phi double [ %89, %.prol.preheader101 ], [ %84, %.lr.ph31 ]
  %.lcssa85.unr.ph = phi double [ %89, %.prol.preheader101 ], [ undef, %.lr.ph31 ]
  %90 = icmp eq i32 %indvar103, 1
  br i1 %90, label %._crit_edge32, label %.lr.ph31.new.preheader

.lr.ph31.new.preheader:                           ; preds = %.prol.loopexit102
  %wide.trip.count.1 = zext i32 %indvars.iv99 to i64
  %91 = sub i64 %78, %indvars.iv97.unr.ph
  %92 = lshr i64 %91, 1
  %93 = and i64 %92, 1
  %lcmp.mod205 = icmp eq i64 %93, 0
  br i1 %lcmp.mod205, label %.lr.ph31.new.prol.preheader, label %.lr.ph31.new.prol.loopexit.unr-lcssa

.lr.ph31.new.prol.preheader:                      ; preds = %.lr.ph31.new.preheader
  br label %.lr.ph31.new.prol

.lr.ph31.new.prol:                                ; preds = %.lr.ph31.new.prol.preheader
  %94 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv109, i64 %indvars.iv97.unr.ph
  %95 = bitcast double* %94 to <2 x double>*
  %96 = getelementptr inbounds double, double* %4, i64 %indvars.iv97.unr.ph
  %97 = bitcast double* %96 to <2 x double>*
  %98 = load <2 x double>, <2 x double>* %95, align 8
  %99 = load <2 x double>, <2 x double>* %97, align 8
  %100 = fmul <2 x double> %98, %99
  %101 = extractelement <2 x double> %100, i32 0
  %102 = extractelement <2 x double> %100, i32 1
  %103 = fsub double %.unr108.ph, %101
  %104 = fsub double %103, %102
  %indvars.iv.next98.1.prol = or i64 %indvars.iv97.unr.ph, 2
  br label %.lr.ph31.new.prol.loopexit.unr-lcssa

.lr.ph31.new.prol.loopexit.unr-lcssa:             ; preds = %.lr.ph31.new.preheader, %.lr.ph31.new.prol
  %.lcssa201.unr.ph = phi double [ %104, %.lr.ph31.new.prol ], [ undef, %.lr.ph31.new.preheader ]
  %indvars.iv97.unr.ph207 = phi i64 [ %indvars.iv.next98.1.prol, %.lr.ph31.new.prol ], [ %indvars.iv97.unr.ph, %.lr.ph31.new.preheader ]
  %.unr206.ph = phi double [ %104, %.lr.ph31.new.prol ], [ %.unr108.ph, %.lr.ph31.new.preheader ]
  br label %.lr.ph31.new.prol.loopexit

.lr.ph31.new.prol.loopexit:                       ; preds = %.lr.ph31.new.prol.loopexit.unr-lcssa
  %105 = icmp eq i64 %92, 0
  br i1 %105, label %._crit_edge32.loopexit, label %.lr.ph31.new.preheader.new

.lr.ph31.new.preheader.new:                       ; preds = %.lr.ph31.new.prol.loopexit
  br label %.lr.ph31.new

.lr.ph31.new:                                     ; preds = %.lr.ph31.new, %.lr.ph31.new.preheader.new
  %indvars.iv97 = phi i64 [ %indvars.iv97.unr.ph207, %.lr.ph31.new.preheader.new ], [ %indvars.iv.next98.1.1, %.lr.ph31.new ]
  %106 = phi double [ %.unr206.ph, %.lr.ph31.new.preheader.new ], [ %128, %.lr.ph31.new ]
  %107 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv109, i64 %indvars.iv97
  %108 = bitcast double* %107 to <2 x double>*
  %109 = getelementptr inbounds double, double* %4, i64 %indvars.iv97
  %110 = bitcast double* %109 to <2 x double>*
  %111 = load <2 x double>, <2 x double>* %108, align 8
  %112 = load <2 x double>, <2 x double>* %110, align 8
  %113 = fmul <2 x double> %111, %112
  %114 = extractelement <2 x double> %113, i32 0
  %115 = extractelement <2 x double> %113, i32 1
  %116 = fsub double %106, %114
  %117 = fsub double %116, %115
  %indvars.iv.next98.1 = add nsw i64 %indvars.iv97, 2
  %118 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv109, i64 %indvars.iv.next98.1
  %119 = bitcast double* %118 to <2 x double>*
  %120 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next98.1
  %121 = bitcast double* %120 to <2 x double>*
  %122 = load <2 x double>, <2 x double>* %119, align 8
  %123 = load <2 x double>, <2 x double>* %121, align 8
  %124 = fmul <2 x double> %122, %123
  %125 = extractelement <2 x double> %124, i32 0
  %126 = extractelement <2 x double> %124, i32 1
  %127 = fsub double %117, %125
  %128 = fsub double %127, %126
  %indvars.iv.next98.1.1 = add nsw i64 %indvars.iv97, 4
  %exitcond.1.1 = icmp eq i64 %indvars.iv.next98.1.1, %wide.trip.count.1
  br i1 %exitcond.1.1, label %._crit_edge32.loopexit.unr-lcssa, label %.lr.ph31.new

._crit_edge32.loopexit.unr-lcssa:                 ; preds = %.lr.ph31.new
  br label %._crit_edge32.loopexit

._crit_edge32.loopexit:                           ; preds = %.lr.ph31.new.prol.loopexit, %._crit_edge32.loopexit.unr-lcssa
  %.lcssa201 = phi double [ %.lcssa201.unr.ph, %.lr.ph31.new.prol.loopexit ], [ %128, %._crit_edge32.loopexit.unr-lcssa ]
  br label %._crit_edge32

._crit_edge32:                                    ; preds = %._crit_edge32.loopexit, %.prol.loopexit102
  %.lcssa85 = phi double [ %.lcssa85.unr.ph, %.prol.loopexit102 ], [ %.lcssa201, %._crit_edge32.loopexit ]
  %129 = bitcast double %.lcssa85 to i64
  br label %130

; <label>:130:                                    ; preds = %._crit_edge32, %77
  %131 = phi i64 [ %129, %._crit_edge32 ], [ %82, %77 ]
  %132 = getelementptr inbounds double, double* %4, i64 %indvars.iv109
  %133 = bitcast double* %132 to i64*
  store i64 %131, i64* %133, align 8
  %indvars.iv.next110 = add nsw i64 %indvars.iv109, 1
  %indvars.iv.next100 = add i32 %indvars.iv99, 1
  %134 = icmp slt i64 %indvars.iv.next110, %18
  %indvar.next104 = add i32 %indvar103, 1
  br i1 %134, label %77, label %.preheader

; <label>:135:                                    ; preds = %.preheader, %._crit_edge
  %indvars.iv94 = phi i64 [ %76, %.preheader ], [ %indvars.iv.next95, %._crit_edge ]
  %indvar = phi i32 [ 0, %.preheader ], [ %indvar.next, %._crit_edge ]
  %indvars.iv = phi i32 [ %0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %storemerge222 = phi i32 [ %storemerge221, %.preheader ], [ %180, %._crit_edge ]
  %136 = add i32 %indvar, -1
  %137 = sext i32 %indvars.iv to i64
  %138 = sext i32 %storemerge222 to i64
  %139 = getelementptr inbounds double, double* %4, i64 %138
  %140 = load double, double* %139, align 8
  %141 = add nsw i64 %indvars.iv94, 1
  %142 = icmp slt i64 %141, %18
  br i1 %142, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %135
  %xtraiter = and i32 %indvar, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv92.prol = phi i64 [ %indvars.iv.next93.prol, %.prol.preheader ], [ %137, %.prol.preheader.preheader ]
  %143 = phi double [ %149, %.prol.preheader ], [ %140, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %144 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv94, i64 %indvars.iv92.prol
  %145 = load double, double* %144, align 8
  %146 = getelementptr inbounds double, double* %3, i64 %indvars.iv92.prol
  %147 = load double, double* %146, align 8
  %148 = fmul double %145, %147
  %149 = fsub double %143, %148
  %indvars.iv.next93.prol = add nsw i64 %indvars.iv92.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !5

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %indvars.iv92.unr = phi i64 [ %137, %.lr.ph ], [ %indvars.iv.next93.prol, %.prol.loopexit.loopexit ]
  %.unr = phi double [ %140, %.lr.ph ], [ %149, %.prol.loopexit.loopexit ]
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %149, %.prol.loopexit.loopexit ]
  %150 = icmp ult i32 %136, 3
  br i1 %150, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv92 = phi i64 [ %indvars.iv.next93.3, %.lr.ph.new ], [ %indvars.iv92.unr, %.lr.ph.new.preheader ]
  %151 = phi double [ %173, %.lr.ph.new ], [ %.unr, %.lr.ph.new.preheader ]
  %152 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv94, i64 %indvars.iv92
  %153 = bitcast double* %152 to <2 x double>*
  %154 = getelementptr inbounds double, double* %3, i64 %indvars.iv92
  %155 = bitcast double* %154 to <2 x double>*
  %156 = load <2 x double>, <2 x double>* %153, align 8
  %157 = load <2 x double>, <2 x double>* %155, align 8
  %158 = fmul <2 x double> %156, %157
  %159 = extractelement <2 x double> %158, i32 0
  %160 = extractelement <2 x double> %158, i32 1
  %161 = fsub double %151, %159
  %162 = fsub double %161, %160
  %indvars.iv.next93.1 = add nsw i64 %indvars.iv92, 2
  %163 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv94, i64 %indvars.iv.next93.1
  %164 = bitcast double* %163 to <2 x double>*
  %165 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next93.1
  %166 = bitcast double* %165 to <2 x double>*
  %167 = load <2 x double>, <2 x double>* %164, align 8
  %168 = load <2 x double>, <2 x double>* %166, align 8
  %169 = fmul <2 x double> %167, %168
  %170 = extractelement <2 x double> %169, i32 0
  %171 = extractelement <2 x double> %169, i32 1
  %172 = fsub double %162, %170
  %173 = fsub double %172, %171
  %indvars.iv.next93.3 = add nsw i64 %indvars.iv92, 4
  %lftr.wideiv.3 = trunc i64 %indvars.iv.next93.3 to i32
  %exitcond.3 = icmp eq i32 %lftr.wideiv.3, %0
  br i1 %exitcond.3, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %135
  %174 = phi double [ %140, %135 ], [ %.lcssa.unr, %.prol.loopexit ], [ %173, %._crit_edge.loopexit ]
  %175 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv94, i64 %indvars.iv94
  %176 = load double, double* %175, align 8
  %177 = fdiv double %174, %176
  %178 = getelementptr inbounds double, double* %3, i64 %indvars.iv94
  store double %177, double* %178, align 8
  %indvars.iv.next95 = add nsw i64 %indvars.iv94, -1
  %179 = icmp sgt i64 %indvars.iv94, 0
  %indvars.iv.next = add i32 %indvars.iv, -1
  %indvar.next = add nuw i32 %indvar, 1
  %180 = trunc i64 %indvars.iv.next95 to i32
  br i1 %179, label %135, label %.preheader.thread.loopexit

.preheader.thread.loopexit:                       ; preds = %._crit_edge
  br label %.preheader.thread

.preheader.thread:                                ; preds = %.preheader.thread.loopexit, %5, %.preheader9
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph, label %._crit_edge3

.lr.ph:                                           ; preds = %2
  %8 = sext i32 %0 to i64
  br label %9

; <label>:9:                                      ; preds = %.lr.ph, %._crit_edge
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge ]
  %storemerge1 = phi i32 [ 0, %.lr.ph ], [ %19, %._crit_edge ]
  %10 = srem i32 %storemerge1, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %9
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %9, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #7
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %18 = icmp slt i64 %indvars.iv.next, %8
  %19 = trunc i64 %indvars.iv.next to i32
  br i1 %18, label %9, label %._crit_edge3.loopexit

._crit_edge3.loopexit:                            ; preds = %._crit_edge
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit, %2
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #6
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
!5 = distinct !{!5, !2}
