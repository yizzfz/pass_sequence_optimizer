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
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call void @init_array(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #4
  tail call void @kernel_cholesky(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %10

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %10

; <label>:9:                                      ; preds = %6
  tail call void @print_array(i32 2000, [2000 x double]* %4)
  br label %10

; <label>:10:                                     ; preds = %6, %9, %2
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32, [2000 x double]* nocapture) #0 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader14.lr.ph, label %._crit_edge40.thread

._crit_edge40.thread:                             ; preds = %2
  %4 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %._crit_edge17

.preheader14.lr.ph:                               ; preds = %2
  %5 = sitofp i32 %0 to double
  %6 = add i32 %0, -2
  %7 = zext i32 %6 to i64
  %8 = sext i32 %0 to i64
  %wide.trip.count91 = zext i32 %0 to i64
  br label %.lr.ph36

.lr.ph36:                                         ; preds = %.preheader14.lr.ph, %._crit_edge38
  %indvars.iv89 = phi i64 [ 0, %.preheader14.lr.ph ], [ %indvars.iv.next90, %._crit_edge38 ]
  %indvars.iv87 = phi i64 [ 1, %.preheader14.lr.ph ], [ %indvars.iv.next88, %._crit_edge38 ]
  %9 = mul nuw nsw i64 %indvars.iv89, 2001
  %10 = add nuw nsw i64 %9, 1
  %scevgep85 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %10
  %11 = sub i64 %7, %indvars.iv89
  %12 = shl i64 %11, 3
  %13 = and i64 %12, 34359738360
  br label %15

.preheader13:                                     ; preds = %15
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1
  %14 = icmp slt i64 %indvars.iv.next90, %8
  br i1 %14, label %._crit_edge38.loopexit, label %._crit_edge38

; <label>:15:                                     ; preds = %15, %.lr.ph36
  %indvars.iv73 = phi i64 [ %indvars.iv.next74, %15 ], [ 0, %.lr.ph36 ]
  %16 = sub nsw i64 0, %indvars.iv73
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, %0
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, %5
  %21 = fadd double %20, 1.000000e+00
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv89, i64 %indvars.iv73
  store double %21, double* %22, align 8
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %exitcond78 = icmp eq i64 %indvars.iv.next74, %indvars.iv87
  br i1 %exitcond78, label %.preheader13, label %15

._crit_edge38.loopexit:                           ; preds = %.preheader13
  %23 = add nuw nsw i64 %13, 8
  %scevgep8586 = bitcast double* %scevgep85 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep8586, i8 0, i64 %23, i32 8, i1 false)
  br label %._crit_edge38

._crit_edge38:                                    ; preds = %._crit_edge38.loopexit, %.preheader13
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv89, i64 %indvars.iv89
  store double 1.000000e+00, double* %24, align 8
  %indvars.iv.next88 = add nuw nsw i64 %indvars.iv87, 1
  %exitcond92 = icmp eq i64 %indvars.iv.next90, %wide.trip.count91
  br i1 %exitcond92, label %._crit_edge40, label %.lr.ph36

._crit_edge40:                                    ; preds = %._crit_edge38
  %25 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %26 = bitcast i8* %25 to [2000 x [2000 x double]]*
  %27 = add i32 %0, -1
  %28 = zext i32 %27 to i64
  %29 = shl nuw nsw i64 %28, 3
  %30 = add nuw nsw i64 %29, 8
  %xtraiter70 = and i32 %0, 3
  %lcmp.mod71 = icmp eq i32 %xtraiter70, 0
  br i1 %lcmp.mod71, label %.preheader12.us.prol.loopexit, label %._crit_edge33.us.prol.preheader

._crit_edge33.us.prol.preheader:                  ; preds = %._crit_edge40
  %31 = add nsw i32 %xtraiter70, -1
  %32 = zext i32 %31 to i64
  br label %._crit_edge33.us.prol

._crit_edge33.us.prol:                            ; preds = %._crit_edge33.us.prol.preheader, %._crit_edge33.us.prol
  %indvars.iv66.prol = phi i64 [ %indvars.iv.next67.prol, %._crit_edge33.us.prol ], [ 0, %._crit_edge33.us.prol.preheader ]
  %prol.iter72 = phi i32 [ %prol.iter72.sub, %._crit_edge33.us.prol ], [ %xtraiter70, %._crit_edge33.us.prol.preheader ]
  %33 = mul nuw nsw i64 %indvars.iv66.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %25, i64 %33
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %30, i32 8, i1 false)
  %indvars.iv.next67.prol = add nuw nsw i64 %indvars.iv66.prol, 1
  %prol.iter72.sub = add nsw i32 %prol.iter72, -1
  %prol.iter72.cmp = icmp eq i32 %prol.iter72.sub, 0
  br i1 %prol.iter72.cmp, label %.preheader12.us.prol.loopexit.loopexit, label %._crit_edge33.us.prol, !llvm.loop !1

.preheader12.us.prol.loopexit.loopexit:           ; preds = %._crit_edge33.us.prol
  %34 = add nuw nsw i64 %32, 1
  br label %.preheader12.us.prol.loopexit

.preheader12.us.prol.loopexit:                    ; preds = %.preheader12.us.prol.loopexit.loopexit, %._crit_edge40
  %indvars.iv66.unr = phi i64 [ 0, %._crit_edge40 ], [ %34, %.preheader12.us.prol.loopexit.loopexit ]
  %35 = icmp ult i32 %27, 3
  br i1 %35, label %.preheader10.lr.ph, label %._crit_edge33.us.3.preheader

._crit_edge33.us.3.preheader:                     ; preds = %.preheader12.us.prol.loopexit
  %36 = add nsw i64 %wide.trip.count91, -4
  %37 = sub nsw i64 %36, %indvars.iv66.unr
  %38 = lshr i64 %37, 2
  %39 = and i64 %38, 1
  %lcmp.mod = icmp eq i64 %39, 0
  br i1 %lcmp.mod, label %._crit_edge33.us.3.prol.preheader, label %._crit_edge33.us.3.prol.loopexit

._crit_edge33.us.3.prol.preheader:                ; preds = %._crit_edge33.us.3.preheader
  br label %._crit_edge33.us.3.prol

._crit_edge33.us.3.prol:                          ; preds = %._crit_edge33.us.3.prol.preheader
  %40 = mul nsw i64 %indvars.iv66.unr, 16000
  %scevgep.prol98 = getelementptr i8, i8* %25, i64 %40
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol98, i8 0, i64 %30, i32 8, i1 false)
  %41 = add i64 %40, 16000
  %scevgep.1.prol = getelementptr i8, i8* %25, i64 %41
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.prol, i8 0, i64 %30, i32 8, i1 false)
  %42 = add i64 %40, 32000
  %scevgep.2.prol = getelementptr i8, i8* %25, i64 %42
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.prol, i8 0, i64 %30, i32 8, i1 false)
  %43 = add i64 %40, 48000
  %scevgep.3.prol = getelementptr i8, i8* %25, i64 %43
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.prol, i8 0, i64 %30, i32 8, i1 false)
  %indvars.iv.next67.3.prol = add nsw i64 %indvars.iv66.unr, 4
  br label %._crit_edge33.us.3.prol.loopexit

._crit_edge33.us.3.prol.loopexit:                 ; preds = %._crit_edge33.us.3.prol, %._crit_edge33.us.3.preheader
  %indvars.iv66.unr99 = phi i64 [ %indvars.iv66.unr, %._crit_edge33.us.3.preheader ], [ %indvars.iv.next67.3.prol, %._crit_edge33.us.3.prol ]
  %44 = icmp eq i64 %38, 0
  br i1 %44, label %.preheader10.lr.ph.loopexit, label %._crit_edge33.us.3.preheader.new

._crit_edge33.us.3.preheader.new:                 ; preds = %._crit_edge33.us.3.prol.loopexit
  br label %._crit_edge33.us.3

.preheader10.lr.ph.loopexit.unr-lcssa:            ; preds = %._crit_edge33.us.3
  br label %.preheader10.lr.ph.loopexit

.preheader10.lr.ph.loopexit:                      ; preds = %._crit_edge33.us.3.prol.loopexit, %.preheader10.lr.ph.loopexit.unr-lcssa
  br label %.preheader10.lr.ph

.preheader10.lr.ph:                               ; preds = %.preheader10.lr.ph.loopexit, %.preheader12.us.prol.loopexit
  %xtraiter52 = and i32 %0, 1
  %lcmp.mod53 = icmp eq i32 %xtraiter52, 0
  %45 = icmp eq i32 %0, 1
  br label %.preheader9.us.us.preheader

.preheader9.us.us.preheader:                      ; preds = %.preheader10.lr.ph, %._crit_edge22.us
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %._crit_edge22.us ], [ 0, %.preheader10.lr.ph ]
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv58
  br label %.preheader9.us.us

._crit_edge22.us:                                 ; preds = %._crit_edge20.us.us
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond61 = icmp eq i64 %indvars.iv.next59, %wide.trip.count91
  br i1 %exitcond61, label %.preheader.us.preheader, label %.preheader9.us.us.preheader

.preheader.us.preheader:                          ; preds = %._crit_edge22.us
  %47 = add nsw i32 %xtraiter70, -1
  %48 = zext i32 %47 to i64
  %49 = add nuw nsw i64 %48, 1
  br label %.preheader.us

.preheader9.us.us:                                ; preds = %._crit_edge20.us.us, %.preheader9.us.us.preheader
  %indvars.iv54 = phi i64 [ 0, %.preheader9.us.us.preheader ], [ %indvars.iv.next55, %._crit_edge20.us.us ]
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv54, i64 %indvars.iv58
  br i1 %lcmp.mod53, label %.prol.loopexit51, label %.prol.preheader50

.prol.preheader50:                                ; preds = %.preheader9.us.us
  %51 = load double, double* %50, align 8
  %52 = load double, double* %46, align 8
  %53 = fmul double %51, %52
  %54 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv54, i64 0
  %55 = load double, double* %54, align 8
  %56 = fadd double %55, %53
  store double %56, double* %54, align 8
  br label %.prol.loopexit51

.prol.loopexit51:                                 ; preds = %.prol.preheader50, %.preheader9.us.us
  %indvars.iv46.unr.ph = phi i64 [ 1, %.prol.preheader50 ], [ 0, %.preheader9.us.us ]
  br i1 %45, label %._crit_edge20.us.us, label %.preheader9.us.us.new.preheader

.preheader9.us.us.new.preheader:                  ; preds = %.prol.loopexit51
  br label %.preheader9.us.us.new

._crit_edge20.us.us.loopexit:                     ; preds = %.preheader9.us.us.new
  br label %._crit_edge20.us.us

._crit_edge20.us.us:                              ; preds = %._crit_edge20.us.us.loopexit, %.prol.loopexit51
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond57 = icmp eq i64 %indvars.iv.next55, %wide.trip.count91
  br i1 %exitcond57, label %._crit_edge22.us, label %.preheader9.us.us

.preheader9.us.us.new:                            ; preds = %.preheader9.us.us.new.preheader, %.preheader9.us.us.new
  %indvars.iv46 = phi i64 [ %indvars.iv.next47.1, %.preheader9.us.us.new ], [ %indvars.iv46.unr.ph, %.preheader9.us.us.new.preheader ]
  %57 = load double, double* %50, align 8
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv46, i64 %indvars.iv58
  %59 = load double, double* %58, align 8
  %60 = fmul double %57, %59
  %61 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv54, i64 %indvars.iv46
  %62 = load double, double* %61, align 8
  %63 = fadd double %62, %60
  store double %63, double* %61, align 8
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %64 = load double, double* %50, align 8
  %65 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next47, i64 %indvars.iv58
  %66 = load double, double* %65, align 8
  %67 = fmul double %64, %66
  %68 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv54, i64 %indvars.iv.next47
  %69 = load double, double* %68, align 8
  %70 = fadd double %69, %67
  store double %70, double* %68, align 8
  %indvars.iv.next47.1 = add nuw nsw i64 %indvars.iv46, 2
  %exitcond49.1 = icmp eq i64 %indvars.iv.next47.1, %wide.trip.count91
  br i1 %exitcond49.1, label %._crit_edge20.us.us.loopexit, label %.preheader9.us.us.new

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv43 = phi i64 [ %indvars.iv.next44, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br i1 %lcmp.mod71, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.preheader.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter70, %.prol.preheader.preheader ]
  %71 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv43, i64 %indvars.iv.prol
  %72 = bitcast double* %71 to i64*
  %73 = load i64, i64* %72, align 8
  %74 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv43, i64 %indvars.iv.prol
  %75 = bitcast double* %74 to i64*
  store i64 %73, i64* %75, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.preheader.us
  %indvars.iv.unr = phi i64 [ 0, %.preheader.us ], [ %49, %.prol.loopexit.loopexit ]
  br i1 %35, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader.us.new ], [ %indvars.iv.unr, %.preheader.us.new.preheader ]
  %76 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv43, i64 %indvars.iv
  %77 = bitcast double* %76 to i64*
  %78 = load i64, i64* %77, align 8
  %79 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv43, i64 %indvars.iv
  %80 = bitcast double* %79 to i64*
  store i64 %78, i64* %80, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %81 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv43, i64 %indvars.iv.next
  %82 = bitcast double* %81 to i64*
  %83 = load i64, i64* %82, align 8
  %84 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv43, i64 %indvars.iv.next
  %85 = bitcast double* %84 to i64*
  store i64 %83, i64* %85, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %86 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv43, i64 %indvars.iv.next.1
  %87 = bitcast double* %86 to i64*
  %88 = load i64, i64* %87, align 8
  %89 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv43, i64 %indvars.iv.next.1
  %90 = bitcast double* %89 to i64*
  store i64 %88, i64* %90, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %91 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv43, i64 %indvars.iv.next.2
  %92 = bitcast double* %91 to i64*
  %93 = load i64, i64* %92, align 8
  %94 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv43, i64 %indvars.iv.next.2
  %95 = bitcast double* %94 to i64*
  store i64 %93, i64* %95, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count91
  br i1 %exitcond.3, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond = icmp eq i64 %indvars.iv.next44, %wide.trip.count91
  br i1 %exitcond, label %._crit_edge17.loopexit, label %.preheader.us

._crit_edge17.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17.loopexit, %._crit_edge40.thread
  %96 = phi i8* [ %4, %._crit_edge40.thread ], [ %25, %._crit_edge17.loopexit ]
  tail call void @free(i8* %96) #4
  ret void

._crit_edge33.us.3:                               ; preds = %._crit_edge33.us.3, %._crit_edge33.us.3.preheader.new
  %indvars.iv66 = phi i64 [ %indvars.iv66.unr99, %._crit_edge33.us.3.preheader.new ], [ %indvars.iv.next67.3.1, %._crit_edge33.us.3 ]
  %97 = mul i64 %indvars.iv66, 16000
  %scevgep = getelementptr i8, i8* %25, i64 %97
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %30, i32 8, i1 false)
  %98 = add i64 %97, 16000
  %scevgep.1 = getelementptr i8, i8* %25, i64 %98
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %30, i32 8, i1 false)
  %99 = add i64 %97, 32000
  %scevgep.2 = getelementptr i8, i8* %25, i64 %99
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %30, i32 8, i1 false)
  %100 = add i64 %97, 48000
  %scevgep.3 = getelementptr i8, i8* %25, i64 %100
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %30, i32 8, i1 false)
  %101 = mul i64 %indvars.iv66, 16000
  %102 = add i64 %101, 64000
  %scevgep.1100 = getelementptr i8, i8* %25, i64 %102
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1100, i8 0, i64 %30, i32 8, i1 false)
  %103 = add i64 %101, 80000
  %scevgep.1.1 = getelementptr i8, i8* %25, i64 %103
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 %30, i32 8, i1 false)
  %104 = add i64 %101, 96000
  %scevgep.2.1 = getelementptr i8, i8* %25, i64 %104
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 %30, i32 8, i1 false)
  %105 = add i64 %101, 112000
  %scevgep.3.1 = getelementptr i8, i8* %25, i64 %105
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 %30, i32 8, i1 false)
  %indvars.iv.next67.3.1 = add nsw i64 %indvars.iv66, 8
  %exitcond69.3.1 = icmp eq i64 %indvars.iv.next67.3.1, %wide.trip.count91
  br i1 %exitcond69.3.1, label %.preheader10.lr.ph.loopexit.unr-lcssa, label %._crit_edge33.us.3
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_cholesky(i32, [2000 x double]* nocapture) #0 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader4.preheader, label %._crit_edge11

.preheader4.preheader:                            ; preds = %2
  %wide.trip.count34 = zext i32 %0 to i64
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader4.preheader, %._crit_edge9
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %._crit_edge9 ], [ 0, %.preheader4.preheader ]
  %4 = add nsw i64 %indvars.iv32, -2
  %5 = add nuw i64 %indvars.iv32, 4294967295
  %6 = icmp sgt i64 %indvars.iv32, 0
  br i1 %6, label %.preheader.preheader, label %._crit_edge9

.preheader.preheader:                             ; preds = %.preheader4
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv32, i64 0
  br label %.preheader

.lr.ph8:                                          ; preds = %._crit_edge
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv32, i64 %indvars.iv32
  %xtraiter2836 = and i64 %indvars.iv32, 1
  %lcmp.mod29 = icmp eq i64 %xtraiter2836, 0
  br i1 %lcmp.mod29, label %.prol.loopexit27, label %.prol.preheader26

.prol.preheader26:                                ; preds = %.lr.ph8
  %9 = load double, double* %7, align 8
  %10 = fmul double %9, %9
  %11 = load double, double* %8, align 8
  %12 = fsub double %11, %10
  store double %12, double* %8, align 8
  br label %.prol.loopexit27

.prol.loopexit27:                                 ; preds = %.prol.preheader26, %.lr.ph8
  %indvars.iv21.unr.ph = phi i64 [ 1, %.prol.preheader26 ], [ 0, %.lr.ph8 ]
  %13 = trunc i64 %5 to i32
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %._crit_edge9, label %.lr.ph8.new.preheader

.lr.ph8.new.preheader:                            ; preds = %.prol.loopexit27
  %.pre38 = load double, double* %8, align 8
  %15 = sub i64 %4, %indvars.iv21.unr.ph
  %16 = lshr i64 %15, 1
  %17 = and i64 %16, 1
  %lcmp.mod40 = icmp eq i64 %17, 0
  br i1 %lcmp.mod40, label %.lr.ph8.new.prol.preheader, label %.lr.ph8.new.prol.loopexit.unr-lcssa

.lr.ph8.new.prol.preheader:                       ; preds = %.lr.ph8.new.preheader
  br label %.lr.ph8.new.prol

.lr.ph8.new.prol:                                 ; preds = %.lr.ph8.new.prol.preheader
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv32, i64 %indvars.iv21.unr.ph
  %19 = load double, double* %18, align 8
  %20 = fmul double %19, %19
  %21 = fsub double %.pre38, %20
  store double %21, double* %8, align 8
  %indvars.iv.next22.prol = add nuw nsw i64 %indvars.iv21.unr.ph, 1
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv32, i64 %indvars.iv.next22.prol
  %23 = load double, double* %22, align 8
  %24 = fmul double %23, %23
  %25 = fsub double %21, %24
  store double %25, double* %8, align 8
  %indvars.iv.next22.1.prol = or i64 %indvars.iv21.unr.ph, 2
  br label %.lr.ph8.new.prol.loopexit.unr-lcssa

.lr.ph8.new.prol.loopexit.unr-lcssa:              ; preds = %.lr.ph8.new.preheader, %.lr.ph8.new.prol
  %.unr.ph = phi double [ %25, %.lr.ph8.new.prol ], [ %.pre38, %.lr.ph8.new.preheader ]
  %indvars.iv21.unr.ph41 = phi i64 [ %indvars.iv.next22.1.prol, %.lr.ph8.new.prol ], [ %indvars.iv21.unr.ph, %.lr.ph8.new.preheader ]
  br label %.lr.ph8.new.prol.loopexit

.lr.ph8.new.prol.loopexit:                        ; preds = %.lr.ph8.new.prol.loopexit.unr-lcssa
  %26 = icmp eq i64 %16, 0
  br i1 %26, label %._crit_edge9.loopexit, label %.lr.ph8.new.preheader.new

.lr.ph8.new.preheader.new:                        ; preds = %.lr.ph8.new.prol.loopexit
  br label %.lr.ph8.new

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %._crit_edge ], [ 0, %.preheader.preheader ]
  %27 = add nuw i64 %indvars.iv16, 4294967295
  %28 = icmp sgt i64 %indvars.iv16, 0
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv32, i64 %indvars.iv16
  br i1 %28, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %xtraiter37 = and i64 %indvars.iv16, 1
  %lcmp.mod = icmp eq i64 %xtraiter37, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %30 = load double, double* %7, align 8
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv16, i64 0
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = load double, double* %29, align 8
  %35 = fsub double %34, %33
  store double %35, double* %29, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %36 = trunc i64 %27 to i32
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  %.pre = load double, double* %29, align 8
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %38 = phi double [ %50, %.lr.ph.new ], [ %.pre, %.lr.ph.new.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv32, i64 %indvars.iv
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv16, i64 %indvars.iv
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = fsub double %38, %43
  store double %44, double* %29, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv32, i64 %indvars.iv.next
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv16, i64 %indvars.iv.next
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = fsub double %44, %49
  store double %50, double* %29, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv16
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader, %.prol.loopexit
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv16, i64 %indvars.iv16
  %52 = load double, double* %51, align 8
  %53 = load double, double* %29, align 8
  %54 = fdiv double %53, %52
  store double %54, double* %29, align 8
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond = icmp eq i64 %indvars.iv.next17, %indvars.iv32
  br i1 %exitcond, label %.lr.ph8, label %.preheader

.lr.ph8.new:                                      ; preds = %.lr.ph8.new, %.lr.ph8.new.preheader.new
  %55 = phi double [ %.unr.ph, %.lr.ph8.new.preheader.new ], [ %71, %.lr.ph8.new ]
  %indvars.iv21 = phi i64 [ %indvars.iv21.unr.ph41, %.lr.ph8.new.preheader.new ], [ %indvars.iv.next22.1.1, %.lr.ph8.new ]
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv32, i64 %indvars.iv21
  %57 = load double, double* %56, align 8
  %58 = fmul double %57, %57
  %59 = fsub double %55, %58
  store double %59, double* %8, align 8
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv32, i64 %indvars.iv.next22
  %61 = load double, double* %60, align 8
  %62 = fmul double %61, %61
  %63 = fsub double %59, %62
  store double %63, double* %8, align 8
  %indvars.iv.next22.1 = add nuw nsw i64 %indvars.iv21, 2
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv32, i64 %indvars.iv.next22.1
  %65 = load double, double* %64, align 8
  %66 = fmul double %65, %65
  %67 = fsub double %63, %66
  store double %67, double* %8, align 8
  %indvars.iv.next22.142 = add nsw i64 %indvars.iv21, 3
  %68 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv32, i64 %indvars.iv.next22.142
  %69 = load double, double* %68, align 8
  %70 = fmul double %69, %69
  %71 = fsub double %67, %70
  store double %71, double* %8, align 8
  %indvars.iv.next22.1.1 = add nsw i64 %indvars.iv21, 4
  %exitcond25.1.1 = icmp eq i64 %indvars.iv.next22.1.1, %indvars.iv32
  br i1 %exitcond25.1.1, label %._crit_edge9.loopexit.unr-lcssa, label %.lr.ph8.new

._crit_edge9.loopexit.unr-lcssa:                  ; preds = %.lr.ph8.new
  br label %._crit_edge9.loopexit

._crit_edge9.loopexit:                            ; preds = %.lr.ph8.new.prol.loopexit, %._crit_edge9.loopexit.unr-lcssa
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit, %.preheader4, %.prol.loopexit27
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv32, i64 %indvars.iv32
  %73 = load double, double* %72, align 8
  %74 = tail call double @sqrt(double %73) #4
  store double %74, double* %72, align 8
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next33, %wide.trip.count34
  br i1 %exitcond35, label %._crit_edge11.loopexit, label %.preheader4

._crit_edge11.loopexit:                           ; preds = %._crit_edge9
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.loopexit, %2
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [2000 x double]* nocapture readonly) #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.preheader, label %._crit_edge4

.preheader.preheader:                             ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count11 = zext i32 %0 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv9 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next10, %._crit_edge ]
  %indvars.iv7 = phi i64 [ 1, %.preheader.preheader ], [ %indvars.iv.next8, %._crit_edge ]
  %9 = mul nsw i64 %indvars.iv9, %8
  br label %10

; <label>:10:                                     ; preds = %17, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %17 ], [ 0, %.lr.ph ]
  %11 = add nsw i64 %indvars.iv, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %17

; <label>:17:                                     ; preds = %15, %10
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv9, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %indvars.iv7
  br i1 %exitcond, label %._crit_edge, label %10

._crit_edge:                                      ; preds = %17
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next10, %wide.trip.count11
  br i1 %exitcond12, label %._crit_edge4.loopexit, label %.lr.ph

._crit_edge4.loopexit:                            ; preds = %._crit_edge
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %2
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #2

; Function Attrs: nounwind
declare double @sqrt(double) #2

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind }
attributes #5 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
