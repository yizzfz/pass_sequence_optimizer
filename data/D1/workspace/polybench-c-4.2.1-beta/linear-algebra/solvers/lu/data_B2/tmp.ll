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
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
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
define internal fastcc void @init_array(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader19.lr.ph, label %._crit_edge47.thread

._crit_edge47.thread:                             ; preds = %2
  %4 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %._crit_edge22

.preheader19.lr.ph:                               ; preds = %2
  %5 = sitofp i32 %0 to double
  %6 = add i32 %0, -2
  %7 = zext i32 %6 to i64
  %8 = sext i32 %0 to i64
  %wide.trip.count98 = zext i32 %0 to i64
  br label %.lr.ph41

.lr.ph41:                                         ; preds = %.preheader19.lr.ph, %._crit_edge45
  %indvars.iv96 = phi i64 [ 0, %.preheader19.lr.ph ], [ %indvars.iv.next97, %._crit_edge45 ]
  %indvars.iv94 = phi i64 [ 1, %.preheader19.lr.ph ], [ %indvars.iv.next95, %._crit_edge45 ]
  %9 = mul nuw nsw i64 %indvars.iv96, 2001
  %10 = add nuw nsw i64 %9, 1
  %scevgep92 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %10
  %11 = sub i64 %7, %indvars.iv96
  %12 = shl i64 %11, 3
  %13 = and i64 %12, 34359738360
  br label %15

.preheader18:                                     ; preds = %15
  %indvars.iv.next97 = add nuw nsw i64 %indvars.iv96, 1
  %14 = icmp slt i64 %indvars.iv.next97, %8
  br i1 %14, label %._crit_edge45.loopexit, label %._crit_edge45

; <label>:15:                                     ; preds = %15, %.lr.ph41
  %indvars.iv80 = phi i64 [ %indvars.iv.next81, %15 ], [ 0, %.lr.ph41 ]
  %16 = sub nsw i64 0, %indvars.iv80
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, %0
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, %5
  %21 = fadd double %20, 1.000000e+00
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv96, i64 %indvars.iv80
  store double %21, double* %22, align 8
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  %exitcond85 = icmp eq i64 %indvars.iv.next81, %indvars.iv94
  br i1 %exitcond85, label %.preheader18, label %15

._crit_edge45.loopexit:                           ; preds = %.preheader18
  %23 = add nuw nsw i64 %13, 8
  %scevgep9293 = bitcast double* %scevgep92 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep9293, i8 0, i64 %23, i32 8, i1 false)
  br label %._crit_edge45

._crit_edge45:                                    ; preds = %._crit_edge45.loopexit, %.preheader18
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv96, i64 %indvars.iv96
  store double 1.000000e+00, double* %24, align 8
  %indvars.iv.next95 = add nuw nsw i64 %indvars.iv94, 1
  %exitcond99 = icmp eq i64 %indvars.iv.next97, %wide.trip.count98
  br i1 %exitcond99, label %._crit_edge47, label %.lr.ph41

._crit_edge47:                                    ; preds = %._crit_edge45
  %25 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %26 = bitcast i8* %25 to [2000 x [2000 x double]]*
  %27 = icmp sgt i32 %0, 0
  br i1 %27, label %.preheader17.us.preheader, label %._crit_edge22

.preheader17.us.preheader:                        ; preds = %._crit_edge47
  %28 = add i32 %0, -1
  %29 = zext i32 %28 to i64
  %30 = shl nuw nsw i64 %29, 3
  %31 = add nuw nsw i64 %30, 8
  %xtraiter77 = and i32 %0, 3
  %lcmp.mod78 = icmp eq i32 %xtraiter77, 0
  br i1 %lcmp.mod78, label %.preheader17.us.prol.loopexit, label %._crit_edge38.us.prol.preheader

._crit_edge38.us.prol.preheader:                  ; preds = %.preheader17.us.preheader
  %32 = add nsw i32 %xtraiter77, -1
  %33 = zext i32 %32 to i64
  br label %._crit_edge38.us.prol

._crit_edge38.us.prol:                            ; preds = %._crit_edge38.us.prol.preheader, %._crit_edge38.us.prol
  %indvars.iv73.prol = phi i64 [ %indvars.iv.next74.prol, %._crit_edge38.us.prol ], [ 0, %._crit_edge38.us.prol.preheader ]
  %prol.iter79 = phi i32 [ %prol.iter79.sub, %._crit_edge38.us.prol ], [ %xtraiter77, %._crit_edge38.us.prol.preheader ]
  %34 = mul nuw nsw i64 %indvars.iv73.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %25, i64 %34
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %31, i32 8, i1 false)
  %indvars.iv.next74.prol = add nuw nsw i64 %indvars.iv73.prol, 1
  %prol.iter79.sub = add nsw i32 %prol.iter79, -1
  %prol.iter79.cmp = icmp eq i32 %prol.iter79.sub, 0
  br i1 %prol.iter79.cmp, label %.preheader17.us.prol.loopexit.loopexit, label %._crit_edge38.us.prol, !llvm.loop !1

.preheader17.us.prol.loopexit.loopexit:           ; preds = %._crit_edge38.us.prol
  %35 = add nuw nsw i64 %33, 1
  br label %.preheader17.us.prol.loopexit

.preheader17.us.prol.loopexit:                    ; preds = %.preheader17.us.prol.loopexit.loopexit, %.preheader17.us.preheader
  %indvars.iv73.unr = phi i64 [ 0, %.preheader17.us.preheader ], [ %35, %.preheader17.us.prol.loopexit.loopexit ]
  %36 = icmp ult i32 %28, 3
  br i1 %36, label %.preheader15.lr.ph, label %._crit_edge38.us.3.preheader

._crit_edge38.us.3.preheader:                     ; preds = %.preheader17.us.prol.loopexit
  %wide.trip.count75.3 = zext i32 %0 to i64
  %37 = add nsw i64 %wide.trip.count75.3, -4
  %38 = sub nsw i64 %37, %indvars.iv73.unr
  %39 = lshr i64 %38, 2
  %40 = and i64 %39, 1
  %lcmp.mod105 = icmp eq i64 %40, 0
  br i1 %lcmp.mod105, label %._crit_edge38.us.3.prol.preheader, label %._crit_edge38.us.3.prol.loopexit

._crit_edge38.us.3.prol.preheader:                ; preds = %._crit_edge38.us.3.preheader
  br label %._crit_edge38.us.3.prol

._crit_edge38.us.3.prol:                          ; preds = %._crit_edge38.us.3.prol.preheader
  %41 = mul nuw nsw i64 %indvars.iv73.unr, 16000
  %scevgep.prol107 = getelementptr i8, i8* %25, i64 %41
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol107, i8 0, i64 %31, i32 8, i1 false)
  %42 = mul nsw i64 %indvars.iv73.unr, 16000
  %43 = add i64 %42, 16000
  %scevgep.1.prol = getelementptr i8, i8* %25, i64 %43
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.prol, i8 0, i64 %31, i32 8, i1 false)
  %44 = mul nsw i64 %indvars.iv73.unr, 16000
  %45 = add i64 %44, 32000
  %scevgep.2.prol = getelementptr i8, i8* %25, i64 %45
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.prol, i8 0, i64 %31, i32 8, i1 false)
  %46 = mul nsw i64 %indvars.iv73.unr, 16000
  %47 = add i64 %46, 48000
  %scevgep.3.prol = getelementptr i8, i8* %25, i64 %47
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.prol, i8 0, i64 %31, i32 8, i1 false)
  %indvars.iv.next74.3.prol = add nsw i64 %indvars.iv73.unr, 4
  br label %._crit_edge38.us.3.prol.loopexit

._crit_edge38.us.3.prol.loopexit:                 ; preds = %._crit_edge38.us.3.prol, %._crit_edge38.us.3.preheader
  %indvars.iv73.unr108 = phi i64 [ %indvars.iv73.unr, %._crit_edge38.us.3.preheader ], [ %indvars.iv.next74.3.prol, %._crit_edge38.us.3.prol ]
  %48 = icmp eq i64 %39, 0
  br i1 %48, label %.preheader16, label %._crit_edge38.us.3.preheader.new

._crit_edge38.us.3.preheader.new:                 ; preds = %._crit_edge38.us.3.prol.loopexit
  br label %._crit_edge38.us.3

.preheader16.unr-lcssa:                           ; preds = %._crit_edge38.us.3
  br label %.preheader16

.preheader16:                                     ; preds = %._crit_edge38.us.3.prol.loopexit, %.preheader16.unr-lcssa
  %49 = icmp sgt i32 %0, 0
  br i1 %49, label %.preheader15.lr.ph, label %._crit_edge22

.preheader15.lr.ph:                               ; preds = %.preheader17.us.prol.loopexit, %.preheader16
  %xtraiter59 = and i32 %0, 1
  %lcmp.mod60 = icmp eq i32 %xtraiter59, 0
  %50 = icmp eq i32 %0, 1
  %wide.trip.count63 = zext i32 %0 to i64
  %wide.trip.count55.1 = zext i32 %0 to i64
  %wide.trip.count67 = zext i32 %0 to i64
  br label %.preheader14.us.us.preheader

.preheader14.us.us.preheader:                     ; preds = %.preheader15.lr.ph, %._crit_edge27.us
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %._crit_edge27.us ], [ 0, %.preheader15.lr.ph ]
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv65
  br label %.preheader14.us.us

._crit_edge27.us:                                 ; preds = %._crit_edge25.us.us
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next66, %wide.trip.count67
  br i1 %exitcond68, label %.preheader13, label %.preheader14.us.us.preheader

.preheader14.us.us:                               ; preds = %._crit_edge25.us.us, %.preheader14.us.us.preheader
  %indvars.iv61 = phi i64 [ 0, %.preheader14.us.us.preheader ], [ %indvars.iv.next62, %._crit_edge25.us.us ]
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv61, i64 %indvars.iv65
  br i1 %lcmp.mod60, label %.prol.loopexit58, label %.prol.preheader57

.prol.preheader57:                                ; preds = %.preheader14.us.us
  %53 = load double, double* %52, align 8
  %54 = load double, double* %51, align 8
  %55 = fmul double %53, %54
  %56 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv61, i64 0
  %57 = load double, double* %56, align 8
  %58 = fadd double %57, %55
  store double %58, double* %56, align 8
  br label %.prol.loopexit58

.prol.loopexit58:                                 ; preds = %.prol.preheader57, %.preheader14.us.us
  %indvars.iv53.unr.ph = phi i64 [ 1, %.prol.preheader57 ], [ 0, %.preheader14.us.us ]
  br i1 %50, label %._crit_edge25.us.us, label %.preheader14.us.us.new.preheader

.preheader14.us.us.new.preheader:                 ; preds = %.prol.loopexit58
  br label %.preheader14.us.us.new

._crit_edge25.us.us.loopexit:                     ; preds = %.preheader14.us.us.new
  br label %._crit_edge25.us.us

._crit_edge25.us.us:                              ; preds = %._crit_edge25.us.us.loopexit, %.prol.loopexit58
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next62, %wide.trip.count63
  br i1 %exitcond64, label %._crit_edge27.us, label %.preheader14.us.us

.preheader14.us.us.new:                           ; preds = %.preheader14.us.us.new.preheader, %.preheader14.us.us.new
  %indvars.iv53 = phi i64 [ %indvars.iv.next54.1, %.preheader14.us.us.new ], [ %indvars.iv53.unr.ph, %.preheader14.us.us.new.preheader ]
  %59 = load double, double* %52, align 8
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv53, i64 %indvars.iv65
  %61 = load double, double* %60, align 8
  %62 = fmul double %59, %61
  %63 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv61, i64 %indvars.iv53
  %64 = load double, double* %63, align 8
  %65 = fadd double %64, %62
  store double %65, double* %63, align 8
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %66 = load double, double* %52, align 8
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next54, i64 %indvars.iv65
  %68 = load double, double* %67, align 8
  %69 = fmul double %66, %68
  %70 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv61, i64 %indvars.iv.next54
  %71 = load double, double* %70, align 8
  %72 = fadd double %71, %69
  store double %72, double* %70, align 8
  %indvars.iv.next54.1 = add nuw nsw i64 %indvars.iv53, 2
  %exitcond56.1 = icmp eq i64 %indvars.iv.next54.1, %wide.trip.count55.1
  br i1 %exitcond56.1, label %._crit_edge25.us.us.loopexit, label %.preheader14.us.us.new

.preheader13:                                     ; preds = %._crit_edge27.us
  %73 = icmp sgt i32 %0, 0
  br i1 %73, label %.preheader.us.preheader, label %._crit_edge22

.preheader.us.preheader:                          ; preds = %.preheader13
  %74 = add i32 %0, -1
  %xtraiter = and i32 %0, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %75 = icmp ult i32 %74, 3
  %wide.trip.count52 = zext i32 %0 to i64
  %wide.trip.count.3 = zext i32 %0 to i64
  %76 = add nsw i32 %xtraiter, -1
  %77 = zext i32 %76 to i64
  %78 = add nuw nsw i64 %77, 1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv50 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next51, %._crit_edge.us ]
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.preheader.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %79 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv50, i64 %indvars.iv.prol
  %80 = bitcast double* %79 to i64*
  %81 = load i64, i64* %80, align 8
  %82 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv50, i64 %indvars.iv.prol
  %83 = bitcast double* %82 to i64*
  store i64 %81, i64* %83, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.preheader.us
  %indvars.iv.unr = phi i64 [ 0, %.preheader.us ], [ %78, %.prol.loopexit.loopexit ]
  br i1 %75, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader.us.new ], [ %indvars.iv.unr, %.preheader.us.new.preheader ]
  %84 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv50, i64 %indvars.iv
  %85 = bitcast double* %84 to i64*
  %86 = load i64, i64* %85, align 8
  %87 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv50, i64 %indvars.iv
  %88 = bitcast double* %87 to i64*
  store i64 %86, i64* %88, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %89 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv50, i64 %indvars.iv.next
  %90 = bitcast double* %89 to i64*
  %91 = load i64, i64* %90, align 8
  %92 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv50, i64 %indvars.iv.next
  %93 = bitcast double* %92 to i64*
  store i64 %91, i64* %93, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %94 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv50, i64 %indvars.iv.next.1
  %95 = bitcast double* %94 to i64*
  %96 = load i64, i64* %95, align 8
  %97 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv50, i64 %indvars.iv.next.1
  %98 = bitcast double* %97 to i64*
  store i64 %96, i64* %98, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %99 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv50, i64 %indvars.iv.next.2
  %100 = bitcast double* %99 to i64*
  %101 = load i64, i64* %100, align 8
  %102 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv50, i64 %indvars.iv.next.2
  %103 = bitcast double* %102 to i64*
  store i64 %101, i64* %103, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond = icmp eq i64 %indvars.iv.next51, %wide.trip.count52
  br i1 %exitcond, label %._crit_edge22.loopexit, label %.preheader.us

._crit_edge22.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge22

._crit_edge22:                                    ; preds = %._crit_edge22.loopexit, %._crit_edge47, %._crit_edge47.thread, %.preheader16, %.preheader13
  %104 = phi i8* [ %25, %.preheader13 ], [ %25, %.preheader16 ], [ %25, %._crit_edge47 ], [ %4, %._crit_edge47.thread ], [ %25, %._crit_edge22.loopexit ]
  tail call void @free(i8* %104) #4
  ret void

._crit_edge38.us.3:                               ; preds = %._crit_edge38.us.3, %._crit_edge38.us.3.preheader.new
  %indvars.iv73 = phi i64 [ %indvars.iv73.unr108, %._crit_edge38.us.3.preheader.new ], [ %indvars.iv.next74.3.1, %._crit_edge38.us.3 ]
  %105 = mul nuw nsw i64 %indvars.iv73, 16000
  %scevgep = getelementptr i8, i8* %25, i64 %105
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %31, i32 8, i1 false)
  %106 = mul i64 %indvars.iv73, 16000
  %107 = add i64 %106, 16000
  %scevgep.1 = getelementptr i8, i8* %25, i64 %107
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %31, i32 8, i1 false)
  %108 = mul i64 %indvars.iv73, 16000
  %109 = add i64 %108, 32000
  %scevgep.2 = getelementptr i8, i8* %25, i64 %109
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %31, i32 8, i1 false)
  %110 = mul i64 %indvars.iv73, 16000
  %111 = add i64 %110, 48000
  %scevgep.3 = getelementptr i8, i8* %25, i64 %111
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %31, i32 8, i1 false)
  %indvars.iv.next74.3 = add nsw i64 %indvars.iv73, 4
  %112 = mul nuw nsw i64 %indvars.iv.next74.3, 16000
  %scevgep.1109 = getelementptr i8, i8* %25, i64 %112
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1109, i8 0, i64 %31, i32 8, i1 false)
  %113 = mul i64 %indvars.iv.next74.3, 16000
  %114 = add i64 %113, 16000
  %scevgep.1.1 = getelementptr i8, i8* %25, i64 %114
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 %31, i32 8, i1 false)
  %115 = mul i64 %indvars.iv.next74.3, 16000
  %116 = add i64 %115, 32000
  %scevgep.2.1 = getelementptr i8, i8* %25, i64 %116
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 %31, i32 8, i1 false)
  %117 = mul i64 %indvars.iv.next74.3, 16000
  %118 = add i64 %117, 48000
  %scevgep.3.1 = getelementptr i8, i8* %25, i64 %118
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 %31, i32 8, i1 false)
  %indvars.iv.next74.3.1 = add nsw i64 %indvars.iv73, 8
  %exitcond76.3.1 = icmp eq i64 %indvars.iv.next74.3.1, %wide.trip.count75.3
  br i1 %exitcond76.3.1, label %.preheader16.unr-lcssa, label %._crit_edge38.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32, [2000 x double]* nocapture) unnamed_addr #2 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader7.preheader, label %._crit_edge18

.preheader7.preheader:                            ; preds = %2
  %wide.trip.count49 = zext i32 %0 to i64
  %wide.trip.count43 = zext i32 %0 to i64
  br label %.preheader7

.preheader7:                                      ; preds = %.preheader7.preheader, %._crit_edge14
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %._crit_edge14 ], [ 0, %.preheader7.preheader ]
  %4 = add nuw i64 %indvars.iv47, 4294967295
  %5 = icmp sgt i64 %indvars.iv47, 0
  br i1 %5, label %.preheader5.preheader, label %._crit_edge14

.preheader5.preheader:                            ; preds = %.preheader7
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv47, i64 0
  br label %.preheader5

.preheader.lr.ph:                                 ; preds = %._crit_edge
  %7 = icmp sgt i64 %indvars.iv47, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge14

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %xtraiter3751 = and i64 %indvars.iv47, 1
  %lcmp.mod38 = icmp eq i64 %xtraiter3751, 0
  %8 = trunc i64 %4 to i32
  %9 = icmp eq i32 %8, 0
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv47, i64 0
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge12.us
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %._crit_edge12.us ], [ %indvars.iv47, %.preheader.us.preheader ]
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv47, i64 %indvars.iv41
  br i1 %lcmp.mod38, label %.prol.loopexit36, label %.prol.preheader35

.prol.preheader35:                                ; preds = %.preheader.us
  %12 = load double, double* %10, align 8
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv41
  %14 = load double, double* %13, align 8
  %15 = fmul double %12, %14
  %16 = load double, double* %11, align 8
  %17 = fsub double %16, %15
  store double %17, double* %11, align 8
  br label %.prol.loopexit36

.prol.loopexit36:                                 ; preds = %.prol.preheader35, %.preheader.us
  %indvars.iv30.unr.ph = phi i64 [ 1, %.prol.preheader35 ], [ 0, %.preheader.us ]
  br i1 %9, label %._crit_edge12.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit36
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv30 = phi i64 [ %indvars.iv.next31.1, %.preheader.us.new ], [ %indvars.iv30.unr.ph, %.preheader.us.new.preheader ]
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv47, i64 %indvars.iv30
  %19 = load double, double* %18, align 8
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv30, i64 %indvars.iv41
  %21 = load double, double* %20, align 8
  %22 = fmul double %19, %21
  %23 = load double, double* %11, align 8
  %24 = fsub double %23, %22
  store double %24, double* %11, align 8
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv47, i64 %indvars.iv.next31
  %26 = load double, double* %25, align 8
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next31, i64 %indvars.iv41
  %28 = load double, double* %27, align 8
  %29 = fmul double %26, %28
  %30 = load double, double* %11, align 8
  %31 = fsub double %30, %29
  store double %31, double* %11, align 8
  %indvars.iv.next31.1 = add nuw nsw i64 %indvars.iv30, 2
  %exitcond34.1 = icmp eq i64 %indvars.iv.next31.1, %indvars.iv47
  br i1 %exitcond34.1, label %._crit_edge12.us.loopexit, label %.preheader.us.new

._crit_edge12.us.loopexit:                        ; preds = %.preheader.us.new
  br label %._crit_edge12.us

._crit_edge12.us:                                 ; preds = %._crit_edge12.us.loopexit, %.prol.loopexit36
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next42, %wide.trip.count43
  br i1 %exitcond44, label %._crit_edge14.loopexit, label %.preheader.us

.preheader5:                                      ; preds = %.preheader5.preheader, %._crit_edge
  %indvars.iv24 = phi i64 [ %indvars.iv.next25, %._crit_edge ], [ 0, %.preheader5.preheader ]
  %32 = add nuw i64 %indvars.iv24, 4294967295
  %33 = icmp sgt i64 %indvars.iv24, 0
  br i1 %33, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader5
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv47, i64 %indvars.iv24
  %xtraiter52 = and i64 %indvars.iv24, 1
  %lcmp.mod = icmp eq i64 %xtraiter52, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %35 = load double, double* %6, align 8
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv24
  %37 = load double, double* %36, align 8
  %38 = fmul double %35, %37
  %39 = load double, double* %34, align 8
  %40 = fsub double %39, %38
  store double %40, double* %34, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %41 = trunc i64 %32 to i32
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv47, i64 %indvars.iv
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv, i64 %indvars.iv24
  %46 = load double, double* %45, align 8
  %47 = fmul double %44, %46
  %48 = load double, double* %34, align 8
  %49 = fsub double %48, %47
  store double %49, double* %34, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv47, i64 %indvars.iv.next
  %51 = load double, double* %50, align 8
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv24
  %53 = load double, double* %52, align 8
  %54 = fmul double %51, %53
  %55 = load double, double* %34, align 8
  %56 = fsub double %55, %54
  store double %56, double* %34, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv24
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %.preheader5
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv24, i64 %indvars.iv24
  %58 = load double, double* %57, align 8
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv47, i64 %indvars.iv24
  %60 = load double, double* %59, align 8
  %61 = fdiv double %60, %58
  store double %61, double* %59, align 8
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond = icmp eq i64 %indvars.iv.next25, %indvars.iv47
  br i1 %exitcond, label %.preheader.lr.ph, label %.preheader5

._crit_edge14.loopexit:                           ; preds = %._crit_edge12.us
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %.preheader7, %.preheader.lr.ph
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond50 = icmp eq i64 %indvars.iv.next48, %wide.trip.count49
  br i1 %exitcond50, label %._crit_edge18.loopexit, label %.preheader7

._crit_edge18.loopexit:                           ; preds = %._crit_edge14
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge18.loopexit, %2
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge4

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count7 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next6, %._crit_edge.us ]
  %9 = mul nsw i64 %indvars.iv5, %8
  br label %10

; <label>:10:                                     ; preds = %17, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %17 ]
  %11 = add nsw i64 %indvars.iv, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #6
  br label %17

; <label>:17:                                     ; preds = %15, %10
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %10

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next6, %wide.trip.count7
  br i1 %exitcond8, label %._crit_edge4.loopexit, label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %2
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #6
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
