; ModuleID = 'A.ll'
source_filename = "lu.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_lu(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %11

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %10)
  br label %11

; <label>:11:                                     ; preds = %6, %9, %2
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]*) unnamed_addr #0 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader15.preheader.lr.ph, label %._crit_edge89.thread

._crit_edge89.thread:                             ; preds = %2
  %4 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %.preheader10._crit_edge

.preheader15.preheader.lr.ph:                     ; preds = %2
  %5 = sitofp i32 %0 to double
  %6 = add i32 %0, -2
  %7 = zext i32 %6 to i64
  %8 = sext i32 %0 to i64
  %wide.trip.count138 = zext i32 %0 to i64
  br label %.lr.ph84

.lr.ph84:                                         ; preds = %.preheader15.preheader.lr.ph, %._crit_edge
  %indvars.iv136 = phi i64 [ 0, %.preheader15.preheader.lr.ph ], [ %indvars.iv.next137, %._crit_edge ]
  %indvars.iv134 = phi i64 [ 1, %.preheader15.preheader.lr.ph ], [ %indvars.iv.next135, %._crit_edge ]
  %9 = mul nuw nsw i64 %indvars.iv136, 2001
  %10 = add nuw nsw i64 %9, 1
  %scevgep132 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %10
  %scevgep132133 = bitcast double* %scevgep132 to i8*
  %11 = sub i64 %7, %indvars.iv136
  %12 = shl i64 %11, 3
  %13 = and i64 %12, 34359738360
  %14 = add nuw nsw i64 %13, 8
  br label %.preheader15

.preheader64:                                     ; preds = %.preheader15
  %indvars.iv.next137 = add nuw nsw i64 %indvars.iv136, 1
  %15 = icmp slt i64 %indvars.iv.next137, %8
  br i1 %15, label %._crit_edge.loopexit, label %._crit_edge

.preheader15:                                     ; preds = %.preheader15, %.lr.ph84
  %indvars.iv120 = phi i64 [ %indvars.iv.next121, %.preheader15 ], [ 0, %.lr.ph84 ]
  %16 = sub nsw i64 0, %indvars.iv120
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, %0
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, %5
  %21 = fadd double %20, 1.000000e+00
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv136, i64 %indvars.iv120
  store double %21, double* %22, align 8
  %indvars.iv.next121 = add nuw nsw i64 %indvars.iv120, 1
  %exitcond125 = icmp eq i64 %indvars.iv.next121, %indvars.iv134
  br i1 %exitcond125, label %.preheader64, label %.preheader15

._crit_edge.loopexit:                             ; preds = %.preheader64
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep132133, i8 0, i64 %14, i32 8, i1 false)
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader64
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv136, i64 %indvars.iv136
  store double 1.000000e+00, double* %23, align 8
  %indvars.iv.next135 = add nuw nsw i64 %indvars.iv134, 1
  %exitcond139 = icmp eq i64 %indvars.iv.next137, %wide.trip.count138
  br i1 %exitcond139, label %._crit_edge89, label %.lr.ph84

._crit_edge89:                                    ; preds = %._crit_edge
  %24 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %25 = bitcast i8* %24 to [2000 x [2000 x double]]*
  %26 = icmp sgt i32 %0, 0
  br i1 %26, label %.preheader14.preheader.us.preheader, label %.preheader10._crit_edge

.preheader14.preheader.us.preheader:              ; preds = %._crit_edge89
  %27 = add i32 %0, -1
  %28 = zext i32 %27 to i64
  %29 = shl nuw nsw i64 %28, 3
  %30 = add nuw nsw i64 %29, 8
  %xtraiter117 = and i32 %0, 3
  %lcmp.mod118 = icmp eq i32 %xtraiter117, 0
  br i1 %lcmp.mod118, label %.preheader14.preheader.us.prol.loopexit, label %.preheader14._crit_edge.us.prol.preheader

.preheader14._crit_edge.us.prol.preheader:        ; preds = %.preheader14.preheader.us.preheader
  br label %.preheader14._crit_edge.us.prol

.preheader14._crit_edge.us.prol:                  ; preds = %.preheader14._crit_edge.us.prol.preheader, %.preheader14._crit_edge.us.prol
  %indvars.iv113.prol = phi i64 [ %indvars.iv.next114.prol, %.preheader14._crit_edge.us.prol ], [ 0, %.preheader14._crit_edge.us.prol.preheader ]
  %prol.iter119 = phi i32 [ %prol.iter119.sub, %.preheader14._crit_edge.us.prol ], [ %xtraiter117, %.preheader14._crit_edge.us.prol.preheader ]
  %31 = mul nuw nsw i64 %indvars.iv113.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %24, i64 %31
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %30, i32 8, i1 false)
  %indvars.iv.next114.prol = add nuw nsw i64 %indvars.iv113.prol, 1
  %prol.iter119.sub = add i32 %prol.iter119, -1
  %prol.iter119.cmp = icmp eq i32 %prol.iter119.sub, 0
  br i1 %prol.iter119.cmp, label %.preheader14.preheader.us.prol.loopexit.loopexit, label %.preheader14._crit_edge.us.prol, !llvm.loop !1

.preheader14.preheader.us.prol.loopexit.loopexit: ; preds = %.preheader14._crit_edge.us.prol
  br label %.preheader14.preheader.us.prol.loopexit

.preheader14.preheader.us.prol.loopexit:          ; preds = %.preheader14.preheader.us.prol.loopexit.loopexit, %.preheader14.preheader.us.preheader
  %indvars.iv113.unr = phi i64 [ 0, %.preheader14.preheader.us.preheader ], [ %indvars.iv.next114.prol, %.preheader14.preheader.us.prol.loopexit.loopexit ]
  %32 = icmp ult i32 %27, 3
  br i1 %32, label %.preheader12.preheader.lr.ph, label %.preheader14._crit_edge.us.3.preheader

.preheader14._crit_edge.us.3.preheader:           ; preds = %.preheader14.preheader.us.prol.loopexit
  %wide.trip.count115.3 = zext i32 %0 to i64
  %33 = add nsw i64 %wide.trip.count115.3, -4
  %34 = sub i64 %33, %indvars.iv113.unr
  %35 = lshr i64 %34, 2
  %36 = and i64 %35, 1
  %lcmp.mod145 = icmp eq i64 %36, 0
  br i1 %lcmp.mod145, label %.preheader14._crit_edge.us.3.prol.preheader, label %.preheader14._crit_edge.us.3.prol.loopexit

.preheader14._crit_edge.us.3.prol.preheader:      ; preds = %.preheader14._crit_edge.us.3.preheader
  br label %.preheader14._crit_edge.us.3.prol

.preheader14._crit_edge.us.3.prol:                ; preds = %.preheader14._crit_edge.us.3.prol.preheader
  %37 = mul nuw nsw i64 %indvars.iv113.unr, 16000
  %scevgep.prol147 = getelementptr i8, i8* %24, i64 %37
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol147, i8 0, i64 %30, i32 8, i1 false)
  %38 = mul i64 %indvars.iv113.unr, 16000
  %39 = add i64 %38, 16000
  %scevgep.1.prol = getelementptr i8, i8* %24, i64 %39
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.prol, i8 0, i64 %30, i32 8, i1 false)
  %40 = mul i64 %indvars.iv113.unr, 16000
  %41 = add i64 %40, 32000
  %scevgep.2.prol = getelementptr i8, i8* %24, i64 %41
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.prol, i8 0, i64 %30, i32 8, i1 false)
  %42 = mul i64 %indvars.iv113.unr, 16000
  %43 = add i64 %42, 48000
  %scevgep.3.prol = getelementptr i8, i8* %24, i64 %43
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.prol, i8 0, i64 %30, i32 8, i1 false)
  %indvars.iv.next114.3.prol = add nsw i64 %indvars.iv113.unr, 4
  br label %.preheader14._crit_edge.us.3.prol.loopexit

.preheader14._crit_edge.us.3.prol.loopexit:       ; preds = %.preheader14._crit_edge.us.3.prol, %.preheader14._crit_edge.us.3.preheader
  %indvars.iv113.unr148 = phi i64 [ %indvars.iv113.unr, %.preheader14._crit_edge.us.3.preheader ], [ %indvars.iv.next114.3.prol, %.preheader14._crit_edge.us.3.prol ]
  %44 = icmp eq i64 %35, 0
  br i1 %44, label %.preheader13.preheader, label %.preheader14._crit_edge.us.3.preheader.new

.preheader14._crit_edge.us.3.preheader.new:       ; preds = %.preheader14._crit_edge.us.3.prol.loopexit
  br label %.preheader14._crit_edge.us.3

.preheader13.preheader.unr-lcssa:                 ; preds = %.preheader14._crit_edge.us.3
  br label %.preheader13.preheader

.preheader13.preheader:                           ; preds = %.preheader14._crit_edge.us.3.prol.loopexit, %.preheader13.preheader.unr-lcssa
  %45 = icmp sgt i32 %0, 0
  br i1 %45, label %.preheader12.preheader.lr.ph, label %.preheader10._crit_edge

.preheader12.preheader.lr.ph:                     ; preds = %.preheader14.preheader.us.prol.loopexit, %.preheader13.preheader
  %xtraiter99 = and i32 %0, 1
  %lcmp.mod100 = icmp eq i32 %xtraiter99, 0
  %46 = icmp eq i32 %0, 1
  %wide.trip.count103 = zext i32 %0 to i64
  %wide.trip.count97.1 = zext i32 %0 to i64
  %wide.trip.count107 = zext i32 %0 to i64
  br label %.preheader11.preheader.us.us.preheader

.preheader11.preheader.us.us.preheader:           ; preds = %.preheader12.preheader.lr.ph, %.preheader12._crit_edge.us
  %indvars.iv105 = phi i64 [ %indvars.iv.next106, %.preheader12._crit_edge.us ], [ 0, %.preheader12.preheader.lr.ph ]
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv105
  br label %.preheader11.preheader.us.us

.preheader12._crit_edge.us:                       ; preds = %.preheader11._crit_edge.us.us
  %indvars.iv.next106 = add nuw nsw i64 %indvars.iv105, 1
  %exitcond108 = icmp eq i64 %indvars.iv.next106, %wide.trip.count107
  br i1 %exitcond108, label %.preheader10.preheader, label %.preheader11.preheader.us.us.preheader

.preheader11.preheader.us.us:                     ; preds = %.preheader11._crit_edge.us.us, %.preheader11.preheader.us.us.preheader
  %indvars.iv101 = phi i64 [ 0, %.preheader11.preheader.us.us.preheader ], [ %indvars.iv.next102, %.preheader11._crit_edge.us.us ]
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv101, i64 %indvars.iv105
  br i1 %lcmp.mod100, label %.preheader11.us.us.prol.loopexit, label %.preheader11.us.us.prol

.preheader11.us.us.prol:                          ; preds = %.preheader11.preheader.us.us
  %49 = load double, double* %48, align 8
  %50 = load double, double* %47, align 8
  %51 = fmul double %49, %50
  %52 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv101, i64 0
  %53 = load double, double* %52, align 8
  %54 = fadd double %53, %51
  store double %54, double* %52, align 8
  br label %.preheader11.us.us.prol.loopexit

.preheader11.us.us.prol.loopexit:                 ; preds = %.preheader11.us.us.prol, %.preheader11.preheader.us.us
  %indvars.iv95.unr.ph = phi i64 [ 1, %.preheader11.us.us.prol ], [ 0, %.preheader11.preheader.us.us ]
  br i1 %46, label %.preheader11._crit_edge.us.us, label %.preheader11.us.us.preheader

.preheader11.us.us.preheader:                     ; preds = %.preheader11.us.us.prol.loopexit
  br label %.preheader11.us.us

.preheader11._crit_edge.us.us.loopexit:           ; preds = %.preheader11.us.us
  br label %.preheader11._crit_edge.us.us

.preheader11._crit_edge.us.us:                    ; preds = %.preheader11._crit_edge.us.us.loopexit, %.preheader11.us.us.prol.loopexit
  %indvars.iv.next102 = add nuw nsw i64 %indvars.iv101, 1
  %exitcond104 = icmp eq i64 %indvars.iv.next102, %wide.trip.count103
  br i1 %exitcond104, label %.preheader12._crit_edge.us, label %.preheader11.preheader.us.us

.preheader11.us.us:                               ; preds = %.preheader11.us.us.preheader, %.preheader11.us.us
  %indvars.iv95 = phi i64 [ %indvars.iv.next96.1, %.preheader11.us.us ], [ %indvars.iv95.unr.ph, %.preheader11.us.us.preheader ]
  %55 = load double, double* %48, align 8
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv95, i64 %indvars.iv105
  %57 = load double, double* %56, align 8
  %58 = fmul double %55, %57
  %59 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv101, i64 %indvars.iv95
  %60 = load double, double* %59, align 8
  %61 = fadd double %60, %58
  store double %61, double* %59, align 8
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95, 1
  %62 = load double, double* %48, align 8
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next96, i64 %indvars.iv105
  %64 = load double, double* %63, align 8
  %65 = fmul double %62, %64
  %66 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv101, i64 %indvars.iv.next96
  %67 = load double, double* %66, align 8
  %68 = fadd double %67, %65
  store double %68, double* %66, align 8
  %indvars.iv.next96.1 = add nsw i64 %indvars.iv95, 2
  %exitcond98.1 = icmp eq i64 %indvars.iv.next96.1, %wide.trip.count97.1
  br i1 %exitcond98.1, label %.preheader11._crit_edge.us.us.loopexit, label %.preheader11.us.us

.preheader10.preheader:                           ; preds = %.preheader12._crit_edge.us
  %69 = icmp sgt i32 %0, 0
  br i1 %69, label %.preheader.preheader.us.preheader, label %.preheader10._crit_edge

.preheader.preheader.us.preheader:                ; preds = %.preheader10.preheader
  %70 = add i32 %0, -1
  %xtraiter = and i32 %0, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %71 = icmp ult i32 %70, 3
  %wide.trip.count94 = zext i32 %0 to i64
  %wide.trip.count.3 = zext i32 %0 to i64
  br label %.preheader.preheader.us

.preheader.preheader.us:                          ; preds = %.preheader._crit_edge.us, %.preheader.preheader.us.preheader
  %indvars.iv92 = phi i64 [ 0, %.preheader.preheader.us.preheader ], [ %indvars.iv.next93, %.preheader._crit_edge.us ]
  br i1 %lcmp.mod, label %.preheader.us.prol.loopexit, label %.preheader.us.prol.preheader

.preheader.us.prol.preheader:                     ; preds = %.preheader.preheader.us
  br label %.preheader.us.prol

.preheader.us.prol:                               ; preds = %.preheader.us.prol.preheader, %.preheader.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.preheader.us.prol ], [ 0, %.preheader.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.preheader.us.prol ], [ %xtraiter, %.preheader.us.prol.preheader ]
  %72 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv92, i64 %indvars.iv.prol
  %73 = bitcast double* %72 to i64*
  %74 = load i64, i64* %73, align 8
  %75 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv92, i64 %indvars.iv.prol
  %76 = bitcast double* %75 to i64*
  store i64 %74, i64* %76, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader.us.prol.loopexit.loopexit, label %.preheader.us.prol, !llvm.loop !3

.preheader.us.prol.loopexit.loopexit:             ; preds = %.preheader.us.prol
  br label %.preheader.us.prol.loopexit

.preheader.us.prol.loopexit:                      ; preds = %.preheader.us.prol.loopexit.loopexit, %.preheader.preheader.us
  %indvars.iv.unr = phi i64 [ 0, %.preheader.preheader.us ], [ %indvars.iv.next.prol, %.preheader.us.prol.loopexit.loopexit ]
  br i1 %71, label %.preheader._crit_edge.us, label %.preheader.us.preheader

.preheader.us.preheader:                          ; preds = %.preheader.us.prol.loopexit
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader.us ], [ %indvars.iv.unr, %.preheader.us.preheader ]
  %77 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv92, i64 %indvars.iv
  %78 = bitcast double* %77 to i64*
  %79 = load i64, i64* %78, align 8
  %80 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv92, i64 %indvars.iv
  %81 = bitcast double* %80 to i64*
  store i64 %79, i64* %81, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %82 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv92, i64 %indvars.iv.next
  %83 = bitcast double* %82 to i64*
  %84 = load i64, i64* %83, align 8
  %85 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv92, i64 %indvars.iv.next
  %86 = bitcast double* %85 to i64*
  store i64 %84, i64* %86, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %87 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv92, i64 %indvars.iv.next.1
  %88 = bitcast double* %87 to i64*
  %89 = load i64, i64* %88, align 8
  %90 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv92, i64 %indvars.iv.next.1
  %91 = bitcast double* %90 to i64*
  store i64 %89, i64* %91, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %92 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv92, i64 %indvars.iv.next.2
  %93 = bitcast double* %92 to i64*
  %94 = load i64, i64* %93, align 8
  %95 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv92, i64 %indvars.iv.next.2
  %96 = bitcast double* %95 to i64*
  store i64 %94, i64* %96, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %.preheader._crit_edge.us.loopexit, label %.preheader.us

.preheader._crit_edge.us.loopexit:                ; preds = %.preheader.us
  br label %.preheader._crit_edge.us

.preheader._crit_edge.us:                         ; preds = %.preheader._crit_edge.us.loopexit, %.preheader.us.prol.loopexit
  %indvars.iv.next93 = add nuw nsw i64 %indvars.iv92, 1
  %exitcond = icmp eq i64 %indvars.iv.next93, %wide.trip.count94
  br i1 %exitcond, label %.preheader10._crit_edge.loopexit, label %.preheader.preheader.us

.preheader10._crit_edge.loopexit:                 ; preds = %.preheader._crit_edge.us
  br label %.preheader10._crit_edge

.preheader10._crit_edge:                          ; preds = %.preheader10._crit_edge.loopexit, %._crit_edge89, %._crit_edge89.thread, %.preheader13.preheader, %.preheader10.preheader
  %97 = phi i8* [ %24, %.preheader10.preheader ], [ %24, %.preheader13.preheader ], [ %24, %._crit_edge89 ], [ %4, %._crit_edge89.thread ], [ %24, %.preheader10._crit_edge.loopexit ]
  tail call void @free(i8* %97) #4
  ret void

.preheader14._crit_edge.us.3:                     ; preds = %.preheader14._crit_edge.us.3, %.preheader14._crit_edge.us.3.preheader.new
  %indvars.iv113 = phi i64 [ %indvars.iv113.unr148, %.preheader14._crit_edge.us.3.preheader.new ], [ %indvars.iv.next114.3.1, %.preheader14._crit_edge.us.3 ]
  %98 = mul nuw nsw i64 %indvars.iv113, 16000
  %scevgep = getelementptr i8, i8* %24, i64 %98
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %30, i32 8, i1 false)
  %99 = mul i64 %indvars.iv113, 16000
  %100 = add i64 %99, 16000
  %scevgep.1 = getelementptr i8, i8* %24, i64 %100
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %30, i32 8, i1 false)
  %101 = mul i64 %indvars.iv113, 16000
  %102 = add i64 %101, 32000
  %scevgep.2 = getelementptr i8, i8* %24, i64 %102
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %30, i32 8, i1 false)
  %103 = mul i64 %indvars.iv113, 16000
  %104 = add i64 %103, 48000
  %scevgep.3 = getelementptr i8, i8* %24, i64 %104
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %30, i32 8, i1 false)
  %indvars.iv.next114.3 = add nsw i64 %indvars.iv113, 4
  %105 = mul nuw nsw i64 %indvars.iv.next114.3, 16000
  %scevgep.1149 = getelementptr i8, i8* %24, i64 %105
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1149, i8 0, i64 %30, i32 8, i1 false)
  %106 = mul i64 %indvars.iv.next114.3, 16000
  %107 = add i64 %106, 16000
  %scevgep.1.1 = getelementptr i8, i8* %24, i64 %107
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 %30, i32 8, i1 false)
  %108 = mul i64 %indvars.iv.next114.3, 16000
  %109 = add i64 %108, 32000
  %scevgep.2.1 = getelementptr i8, i8* %24, i64 %109
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 %30, i32 8, i1 false)
  %110 = mul i64 %indvars.iv.next114.3, 16000
  %111 = add i64 %110, 48000
  %scevgep.3.1 = getelementptr i8, i8* %24, i64 %111
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 %30, i32 8, i1 false)
  %indvars.iv.next114.3.1 = add nsw i64 %indvars.iv113, 8
  %exitcond116.3.1 = icmp eq i64 %indvars.iv.next114.3.1, %wide.trip.count115.3
  br i1 %exitcond116.3.1, label %.preheader13.preheader.unr-lcssa, label %.preheader14._crit_edge.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32, [2000 x double]*) unnamed_addr #2 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader6.preheader.preheader, label %._crit_edge44

.preheader6.preheader.preheader:                  ; preds = %2
  %wide.trip.count73 = zext i32 %0 to i64
  %wide.trip.count67 = zext i32 %0 to i64
  br label %.preheader6.preheader

.preheader6.preheader:                            ; preds = %.preheader6.preheader.preheader, %._crit_edge
  %indvars.iv71 = phi i64 [ %indvars.iv.next72, %._crit_edge ], [ 0, %.preheader6.preheader.preheader ]
  %4 = add i64 %indvars.iv71, 4294967295
  %5 = icmp sgt i64 %indvars.iv71, 0
  br i1 %5, label %.preheader5.preheader.preheader, label %._crit_edge

.preheader5.preheader.preheader:                  ; preds = %.preheader6.preheader
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv71, i64 0
  br label %.preheader5.preheader

.preheader.preheader.lr.ph:                       ; preds = %.preheader6
  %7 = icmp sgt i64 %indvars.iv71, 0
  br i1 %7, label %.preheader.preheader.us.preheader, label %._crit_edge

.preheader.preheader.us.preheader:                ; preds = %.preheader.preheader.lr.ph
  %xtraiter6175 = and i64 %indvars.iv71, 1
  %lcmp.mod62 = icmp eq i64 %xtraiter6175, 0
  %8 = trunc i64 %4 to i32
  %9 = icmp eq i32 %8, 0
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv71, i64 0
  br label %.preheader.preheader.us

.preheader.preheader.us:                          ; preds = %.preheader.preheader.us.preheader, %.preheader._crit_edge.us
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %.preheader._crit_edge.us ], [ %indvars.iv71, %.preheader.preheader.us.preheader ]
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv71, i64 %indvars.iv65
  br i1 %lcmp.mod62, label %.preheader.us.prol.loopexit, label %.preheader.us.prol

.preheader.us.prol:                               ; preds = %.preheader.preheader.us
  %12 = load double, double* %10, align 8
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv65
  %14 = load double, double* %13, align 8
  %15 = fmul double %12, %14
  %16 = load double, double* %11, align 8
  %17 = fsub double %16, %15
  store double %17, double* %11, align 8
  br label %.preheader.us.prol.loopexit

.preheader.us.prol.loopexit:                      ; preds = %.preheader.us.prol, %.preheader.preheader.us
  %indvars.iv56.unr.ph = phi i64 [ 1, %.preheader.us.prol ], [ 0, %.preheader.preheader.us ]
  br i1 %9, label %.preheader._crit_edge.us, label %.preheader.us.preheader

.preheader.us.preheader:                          ; preds = %.preheader.us.prol.loopexit
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %.preheader.us
  %indvars.iv56 = phi i64 [ %indvars.iv.next57.1, %.preheader.us ], [ %indvars.iv56.unr.ph, %.preheader.us.preheader ]
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv71, i64 %indvars.iv56
  %19 = load double, double* %18, align 8
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv56, i64 %indvars.iv65
  %21 = load double, double* %20, align 8
  %22 = fmul double %19, %21
  %23 = load double, double* %11, align 8
  %24 = fsub double %23, %22
  store double %24, double* %11, align 8
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv71, i64 %indvars.iv.next57
  %26 = load double, double* %25, align 8
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next57, i64 %indvars.iv65
  %28 = load double, double* %27, align 8
  %29 = fmul double %26, %28
  %30 = load double, double* %11, align 8
  %31 = fsub double %30, %29
  store double %31, double* %11, align 8
  %indvars.iv.next57.1 = add nsw i64 %indvars.iv56, 2
  %exitcond60.1 = icmp eq i64 %indvars.iv.next57.1, %indvars.iv71
  br i1 %exitcond60.1, label %.preheader._crit_edge.us.loopexit, label %.preheader.us

.preheader._crit_edge.us.loopexit:                ; preds = %.preheader.us
  br label %.preheader._crit_edge.us

.preheader._crit_edge.us:                         ; preds = %.preheader._crit_edge.us.loopexit, %.preheader.us.prol.loopexit
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next66, %wide.trip.count67
  br i1 %exitcond68, label %._crit_edge.loopexit, label %.preheader.preheader.us

.preheader5.preheader:                            ; preds = %.preheader5.preheader.preheader, %.preheader6
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %.preheader6 ], [ 0, %.preheader5.preheader.preheader ]
  %32 = add i64 %indvars.iv50, 4294967295
  %33 = icmp sgt i64 %indvars.iv50, 0
  br i1 %33, label %.lr.ph, label %.preheader6

.lr.ph:                                           ; preds = %.preheader5.preheader
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv71, i64 %indvars.iv50
  %xtraiter76 = and i64 %indvars.iv50, 1
  %lcmp.mod = icmp eq i64 %xtraiter76, 0
  br i1 %lcmp.mod, label %.preheader5.prol.loopexit, label %.preheader5.prol

.preheader5.prol:                                 ; preds = %.lr.ph
  %35 = load double, double* %6, align 8
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv50
  %37 = load double, double* %36, align 8
  %38 = fmul double %35, %37
  %39 = load double, double* %34, align 8
  %40 = fsub double %39, %38
  store double %40, double* %34, align 8
  br label %.preheader5.prol.loopexit

.preheader5.prol.loopexit:                        ; preds = %.preheader5.prol, %.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %.preheader5.prol ], [ 0, %.lr.ph ]
  %41 = trunc i64 %32 to i32
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %.preheader6, label %.preheader5.preheader79

.preheader5.preheader79:                          ; preds = %.preheader5.prol.loopexit
  br label %.preheader5

.preheader5:                                      ; preds = %.preheader5.preheader79, %.preheader5
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader5 ], [ %indvars.iv.unr.ph, %.preheader5.preheader79 ]
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv71, i64 %indvars.iv
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv, i64 %indvars.iv50
  %46 = load double, double* %45, align 8
  %47 = fmul double %44, %46
  %48 = load double, double* %34, align 8
  %49 = fsub double %48, %47
  store double %49, double* %34, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv71, i64 %indvars.iv.next
  %51 = load double, double* %50, align 8
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv50
  %53 = load double, double* %52, align 8
  %54 = fmul double %51, %53
  %55 = load double, double* %34, align 8
  %56 = fsub double %55, %54
  store double %56, double* %34, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv50
  br i1 %exitcond.1, label %.preheader6.loopexit, label %.preheader5

.preheader6.loopexit:                             ; preds = %.preheader5
  br label %.preheader6

.preheader6:                                      ; preds = %.preheader6.loopexit, %.preheader5.prol.loopexit, %.preheader5.preheader
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv50, i64 %indvars.iv50
  %58 = load double, double* %57, align 8
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv71, i64 %indvars.iv50
  %60 = load double, double* %59, align 8
  %61 = fdiv double %60, %58
  store double %61, double* %59, align 8
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond = icmp eq i64 %indvars.iv.next51, %indvars.iv71
  br i1 %exitcond, label %.preheader.preheader.lr.ph, label %.preheader5.preheader

._crit_edge.loopexit:                             ; preds = %.preheader._crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader6.preheader, %.preheader.preheader.lr.ph
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %exitcond74 = icmp eq i64 %indvars.iv.next72, %wide.trip.count73
  br i1 %exitcond74, label %._crit_edge44.loopexit, label %.preheader6.preheader

._crit_edge44.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge44

._crit_edge44:                                    ; preds = %._crit_edge44.loopexit, %2
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.preheader.us.preheader, label %._crit_edge

.preheader.preheader.us.preheader:                ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count13 = zext i32 %0 to i64
  br label %.preheader.preheader.us

.preheader.preheader.us:                          ; preds = %.preheader._crit_edge.us, %.preheader.preheader.us.preheader
  %indvars.iv11 = phi i64 [ 0, %.preheader.preheader.us.preheader ], [ %indvars.iv.next12, %.preheader._crit_edge.us ]
  %9 = mul nsw i64 %indvars.iv11, %8
  br label %10

; <label>:10:                                     ; preds = %.preheader.us, %.preheader.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.preheader.us ], [ %indvars.iv.next, %.preheader.us ]
  %11 = add nsw i64 %indvars.iv, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %.preheader.us

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %15, %10
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv11, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %.preheader._crit_edge.us, label %10

.preheader._crit_edge.us:                         ; preds = %.preheader.us
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next12, %wide.trip.count13
  br i1 %exitcond14, label %._crit_edge.loopexit, label %.preheader.preheader.us

._crit_edge.loopexit:                             ; preds = %.preheader._crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

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
