; ModuleID = 'A.ll'
source_filename = "cholesky.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
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
define internal void @init_array(i32, [2000 x double]*) #0 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader71.lr.ph, label %._crit_edge100.thread

._crit_edge100.thread:                            ; preds = %2
  %4 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %._crit_edge74

.preheader71.lr.ph:                               ; preds = %2
  %5 = sitofp i32 %0 to double
  %6 = add i32 %0, -2
  %7 = zext i32 %6 to i64
  %8 = sext i32 %0 to i64
  %wide.trip.count151 = zext i32 %0 to i64
  br label %.lr.ph93

.lr.ph93:                                         ; preds = %.preheader71.lr.ph, %._crit_edge98
  %indvars.iv149 = phi i64 [ 0, %.preheader71.lr.ph ], [ %indvars.iv.next150, %._crit_edge98 ]
  %indvars.iv147 = phi i64 [ 1, %.preheader71.lr.ph ], [ %indvars.iv.next148, %._crit_edge98 ]
  %9 = mul nuw nsw i64 %indvars.iv149, 2001
  %10 = add nuw nsw i64 %9, 1
  %scevgep145 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %10
  %scevgep145146 = bitcast double* %scevgep145 to i8*
  %11 = sub i64 %7, %indvars.iv149
  %12 = shl i64 %11, 3
  %13 = and i64 %12, 34359738360
  %14 = add nuw nsw i64 %13, 8
  br label %15

; <label>:15:                                     ; preds = %15, %.lr.ph93
  %indvars.iv133 = phi i64 [ %indvars.iv.next134, %15 ], [ 0, %.lr.ph93 ]
  %16 = sub nsw i64 0, %indvars.iv133
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, %0
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, %5
  %21 = fadd double %20, 1.000000e+00
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv149, i64 %indvars.iv133
  store double %21, double* %22, align 8
  %indvars.iv.next134 = add nuw nsw i64 %indvars.iv133, 1
  %exitcond138 = icmp eq i64 %indvars.iv.next134, %indvars.iv147
  br i1 %exitcond138, label %._crit_edge94, label %15

._crit_edge94:                                    ; preds = %15
  %indvars.iv.next150 = add nuw nsw i64 %indvars.iv149, 1
  %23 = icmp slt i64 %indvars.iv.next150, %8
  br i1 %23, label %._crit_edge98.loopexit, label %._crit_edge98

._crit_edge98.loopexit:                           ; preds = %._crit_edge94
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep145146, i8 0, i64 %14, i32 8, i1 false)
  br label %._crit_edge98

._crit_edge98:                                    ; preds = %._crit_edge98.loopexit, %._crit_edge94
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv149, i64 %indvars.iv149
  store double 1.000000e+00, double* %24, align 8
  %indvars.iv.next148 = add nuw nsw i64 %indvars.iv147, 1
  %exitcond152 = icmp eq i64 %indvars.iv.next150, %wide.trip.count151
  br i1 %exitcond152, label %._crit_edge100, label %.lr.ph93

._crit_edge100:                                   ; preds = %._crit_edge98
  %25 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %26 = bitcast i8* %25 to [2000 x [2000 x double]]*
  %27 = icmp sgt i32 %0, 0
  br i1 %27, label %.preheader70.us.preheader, label %._crit_edge74

.preheader70.us.preheader:                        ; preds = %._crit_edge100
  %28 = add i32 %0, -1
  %29 = zext i32 %28 to i64
  %30 = shl nuw nsw i64 %29, 3
  %31 = add nuw nsw i64 %30, 8
  %xtraiter130 = and i32 %0, 3
  %lcmp.mod131 = icmp eq i32 %xtraiter130, 0
  br i1 %lcmp.mod131, label %.preheader70.us.prol.loopexit, label %._crit_edge90.us.prol.preheader

._crit_edge90.us.prol.preheader:                  ; preds = %.preheader70.us.preheader
  br label %._crit_edge90.us.prol

._crit_edge90.us.prol:                            ; preds = %._crit_edge90.us.prol.preheader, %._crit_edge90.us.prol
  %indvars.iv126.prol = phi i64 [ %indvars.iv.next127.prol, %._crit_edge90.us.prol ], [ 0, %._crit_edge90.us.prol.preheader ]
  %prol.iter132 = phi i32 [ %prol.iter132.sub, %._crit_edge90.us.prol ], [ %xtraiter130, %._crit_edge90.us.prol.preheader ]
  %32 = mul nuw nsw i64 %indvars.iv126.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %25, i64 %32
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %31, i32 8, i1 false)
  %indvars.iv.next127.prol = add nuw nsw i64 %indvars.iv126.prol, 1
  %prol.iter132.sub = add i32 %prol.iter132, -1
  %prol.iter132.cmp = icmp eq i32 %prol.iter132.sub, 0
  br i1 %prol.iter132.cmp, label %.preheader70.us.prol.loopexit.loopexit, label %._crit_edge90.us.prol, !llvm.loop !1

.preheader70.us.prol.loopexit.loopexit:           ; preds = %._crit_edge90.us.prol
  br label %.preheader70.us.prol.loopexit

.preheader70.us.prol.loopexit:                    ; preds = %.preheader70.us.prol.loopexit.loopexit, %.preheader70.us.preheader
  %indvars.iv126.unr = phi i64 [ 0, %.preheader70.us.preheader ], [ %indvars.iv.next127.prol, %.preheader70.us.prol.loopexit.loopexit ]
  %33 = icmp ult i32 %28, 3
  br i1 %33, label %.preheader68.lr.ph, label %._crit_edge90.us.3.preheader

._crit_edge90.us.3.preheader:                     ; preds = %.preheader70.us.prol.loopexit
  %wide.trip.count128.3 = zext i32 %0 to i64
  %34 = add nsw i64 %wide.trip.count128.3, -4
  %35 = sub i64 %34, %indvars.iv126.unr
  %36 = lshr i64 %35, 2
  %37 = and i64 %36, 1
  %lcmp.mod158 = icmp eq i64 %37, 0
  br i1 %lcmp.mod158, label %._crit_edge90.us.3.prol.preheader, label %._crit_edge90.us.3.prol.loopexit

._crit_edge90.us.3.prol.preheader:                ; preds = %._crit_edge90.us.3.preheader
  br label %._crit_edge90.us.3.prol

._crit_edge90.us.3.prol:                          ; preds = %._crit_edge90.us.3.prol.preheader
  %38 = mul nuw nsw i64 %indvars.iv126.unr, 16000
  %scevgep.prol160 = getelementptr i8, i8* %25, i64 %38
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol160, i8 0, i64 %31, i32 8, i1 false)
  %39 = mul i64 %indvars.iv126.unr, 16000
  %40 = add i64 %39, 16000
  %scevgep.1.prol = getelementptr i8, i8* %25, i64 %40
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.prol, i8 0, i64 %31, i32 8, i1 false)
  %41 = mul i64 %indvars.iv126.unr, 16000
  %42 = add i64 %41, 32000
  %scevgep.2.prol = getelementptr i8, i8* %25, i64 %42
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.prol, i8 0, i64 %31, i32 8, i1 false)
  %43 = mul i64 %indvars.iv126.unr, 16000
  %44 = add i64 %43, 48000
  %scevgep.3.prol = getelementptr i8, i8* %25, i64 %44
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.prol, i8 0, i64 %31, i32 8, i1 false)
  %indvars.iv.next127.3.prol = add nsw i64 %indvars.iv126.unr, 4
  br label %._crit_edge90.us.3.prol.loopexit

._crit_edge90.us.3.prol.loopexit:                 ; preds = %._crit_edge90.us.3.prol, %._crit_edge90.us.3.preheader
  %indvars.iv126.unr161 = phi i64 [ %indvars.iv126.unr, %._crit_edge90.us.3.preheader ], [ %indvars.iv.next127.3.prol, %._crit_edge90.us.3.prol ]
  %45 = icmp eq i64 %36, 0
  br i1 %45, label %.preheader69, label %._crit_edge90.us.3.preheader.new

._crit_edge90.us.3.preheader.new:                 ; preds = %._crit_edge90.us.3.prol.loopexit
  br label %._crit_edge90.us.3

.preheader69.unr-lcssa:                           ; preds = %._crit_edge90.us.3
  br label %.preheader69

.preheader69:                                     ; preds = %._crit_edge90.us.3.prol.loopexit, %.preheader69.unr-lcssa
  %46 = icmp sgt i32 %0, 0
  br i1 %46, label %.preheader68.lr.ph, label %._crit_edge74

.preheader68.lr.ph:                               ; preds = %.preheader70.us.prol.loopexit, %.preheader69
  %xtraiter112 = and i32 %0, 1
  %lcmp.mod113 = icmp eq i32 %xtraiter112, 0
  %47 = icmp eq i32 %0, 1
  %wide.trip.count116 = zext i32 %0 to i64
  %wide.trip.count108.1 = zext i32 %0 to i64
  %wide.trip.count120 = zext i32 %0 to i64
  br label %.preheader67.us.us.preheader

.preheader67.us.us.preheader:                     ; preds = %.preheader68.lr.ph, %._crit_edge79.us
  %indvars.iv118 = phi i64 [ %indvars.iv.next119, %._crit_edge79.us ], [ 0, %.preheader68.lr.ph ]
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv118
  br label %.preheader67.us.us

._crit_edge79.us:                                 ; preds = %._crit_edge77.us.us
  %indvars.iv.next119 = add nuw nsw i64 %indvars.iv118, 1
  %exitcond121 = icmp eq i64 %indvars.iv.next119, %wide.trip.count120
  br i1 %exitcond121, label %.preheader66, label %.preheader67.us.us.preheader

.preheader67.us.us:                               ; preds = %._crit_edge77.us.us, %.preheader67.us.us.preheader
  %indvars.iv114 = phi i64 [ 0, %.preheader67.us.us.preheader ], [ %indvars.iv.next115, %._crit_edge77.us.us ]
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv114, i64 %indvars.iv118
  br i1 %lcmp.mod113, label %.prol.loopexit111, label %.prol.preheader110

.prol.preheader110:                               ; preds = %.preheader67.us.us
  %50 = load double, double* %49, align 8
  %51 = load double, double* %48, align 8
  %52 = fmul double %50, %51
  %53 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv114, i64 0
  %54 = load double, double* %53, align 8
  %55 = fadd double %54, %52
  store double %55, double* %53, align 8
  br label %.prol.loopexit111

.prol.loopexit111:                                ; preds = %.prol.preheader110, %.preheader67.us.us
  %indvars.iv106.unr.ph = phi i64 [ 1, %.prol.preheader110 ], [ 0, %.preheader67.us.us ]
  br i1 %47, label %._crit_edge77.us.us, label %.preheader67.us.us.new.preheader

.preheader67.us.us.new.preheader:                 ; preds = %.prol.loopexit111
  br label %.preheader67.us.us.new

._crit_edge77.us.us.loopexit:                     ; preds = %.preheader67.us.us.new
  br label %._crit_edge77.us.us

._crit_edge77.us.us:                              ; preds = %._crit_edge77.us.us.loopexit, %.prol.loopexit111
  %indvars.iv.next115 = add nuw nsw i64 %indvars.iv114, 1
  %exitcond117 = icmp eq i64 %indvars.iv.next115, %wide.trip.count116
  br i1 %exitcond117, label %._crit_edge79.us, label %.preheader67.us.us

.preheader67.us.us.new:                           ; preds = %.preheader67.us.us.new.preheader, %.preheader67.us.us.new
  %indvars.iv106 = phi i64 [ %indvars.iv.next107.1, %.preheader67.us.us.new ], [ %indvars.iv106.unr.ph, %.preheader67.us.us.new.preheader ]
  %56 = load double, double* %49, align 8
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %indvars.iv118
  %58 = load double, double* %57, align 8
  %59 = fmul double %56, %58
  %60 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv114, i64 %indvars.iv106
  %61 = load double, double* %60, align 8
  %62 = fadd double %61, %59
  store double %62, double* %60, align 8
  %indvars.iv.next107 = add nuw nsw i64 %indvars.iv106, 1
  %63 = load double, double* %49, align 8
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next107, i64 %indvars.iv118
  %65 = load double, double* %64, align 8
  %66 = fmul double %63, %65
  %67 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv114, i64 %indvars.iv.next107
  %68 = load double, double* %67, align 8
  %69 = fadd double %68, %66
  store double %69, double* %67, align 8
  %indvars.iv.next107.1 = add nsw i64 %indvars.iv106, 2
  %exitcond109.1 = icmp eq i64 %indvars.iv.next107.1, %wide.trip.count108.1
  br i1 %exitcond109.1, label %._crit_edge77.us.us.loopexit, label %.preheader67.us.us.new

.preheader66:                                     ; preds = %._crit_edge79.us
  %70 = icmp sgt i32 %0, 0
  br i1 %70, label %.preheader.us.preheader, label %._crit_edge74

.preheader.us.preheader:                          ; preds = %.preheader66
  %71 = add i32 %0, -1
  %xtraiter = and i32 %0, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %72 = icmp ult i32 %71, 3
  %wide.trip.count105 = zext i32 %0 to i64
  %wide.trip.count.3 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv103 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next104, %._crit_edge.us ]
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.preheader.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %73 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv103, i64 %indvars.iv.prol
  %74 = bitcast double* %73 to i64*
  %75 = load i64, i64* %74, align 8
  %76 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv103, i64 %indvars.iv.prol
  %77 = bitcast double* %76 to i64*
  store i64 %75, i64* %77, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.preheader.us
  %indvars.iv.unr = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  br i1 %72, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader.us.new ], [ %indvars.iv.unr, %.preheader.us.new.preheader ]
  %78 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv103, i64 %indvars.iv
  %79 = bitcast double* %78 to i64*
  %80 = load i64, i64* %79, align 8
  %81 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv103, i64 %indvars.iv
  %82 = bitcast double* %81 to i64*
  store i64 %80, i64* %82, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %83 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv103, i64 %indvars.iv.next
  %84 = bitcast double* %83 to i64*
  %85 = load i64, i64* %84, align 8
  %86 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv103, i64 %indvars.iv.next
  %87 = bitcast double* %86 to i64*
  store i64 %85, i64* %87, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %88 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv103, i64 %indvars.iv.next.1
  %89 = bitcast double* %88 to i64*
  %90 = load i64, i64* %89, align 8
  %91 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv103, i64 %indvars.iv.next.1
  %92 = bitcast double* %91 to i64*
  store i64 %90, i64* %92, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %93 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv103, i64 %indvars.iv.next.2
  %94 = bitcast double* %93 to i64*
  %95 = load i64, i64* %94, align 8
  %96 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv103, i64 %indvars.iv.next.2
  %97 = bitcast double* %96 to i64*
  store i64 %95, i64* %97, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next104 = add nuw nsw i64 %indvars.iv103, 1
  %exitcond = icmp eq i64 %indvars.iv.next104, %wide.trip.count105
  br i1 %exitcond, label %._crit_edge74.loopexit, label %.preheader.us

._crit_edge74.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge74

._crit_edge74:                                    ; preds = %._crit_edge74.loopexit, %._crit_edge100, %._crit_edge100.thread, %.preheader69, %.preheader66
  %98 = phi i8* [ %25, %.preheader66 ], [ %25, %.preheader69 ], [ %25, %._crit_edge100 ], [ %4, %._crit_edge100.thread ], [ %25, %._crit_edge74.loopexit ]
  tail call void @free(i8* %98) #4
  ret void

._crit_edge90.us.3:                               ; preds = %._crit_edge90.us.3, %._crit_edge90.us.3.preheader.new
  %indvars.iv126 = phi i64 [ %indvars.iv126.unr161, %._crit_edge90.us.3.preheader.new ], [ %indvars.iv.next127.3.1, %._crit_edge90.us.3 ]
  %99 = mul nuw nsw i64 %indvars.iv126, 16000
  %scevgep = getelementptr i8, i8* %25, i64 %99
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %31, i32 8, i1 false)
  %100 = mul i64 %indvars.iv126, 16000
  %101 = add i64 %100, 16000
  %scevgep.1 = getelementptr i8, i8* %25, i64 %101
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %31, i32 8, i1 false)
  %102 = mul i64 %indvars.iv126, 16000
  %103 = add i64 %102, 32000
  %scevgep.2 = getelementptr i8, i8* %25, i64 %103
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %31, i32 8, i1 false)
  %104 = mul i64 %indvars.iv126, 16000
  %105 = add i64 %104, 48000
  %scevgep.3 = getelementptr i8, i8* %25, i64 %105
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %31, i32 8, i1 false)
  %indvars.iv.next127.3 = add nsw i64 %indvars.iv126, 4
  %106 = mul nuw nsw i64 %indvars.iv.next127.3, 16000
  %scevgep.1162 = getelementptr i8, i8* %25, i64 %106
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1162, i8 0, i64 %31, i32 8, i1 false)
  %107 = mul i64 %indvars.iv.next127.3, 16000
  %108 = add i64 %107, 16000
  %scevgep.1.1 = getelementptr i8, i8* %25, i64 %108
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 %31, i32 8, i1 false)
  %109 = mul i64 %indvars.iv.next127.3, 16000
  %110 = add i64 %109, 32000
  %scevgep.2.1 = getelementptr i8, i8* %25, i64 %110
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 %31, i32 8, i1 false)
  %111 = mul i64 %indvars.iv.next127.3, 16000
  %112 = add i64 %111, 48000
  %scevgep.3.1 = getelementptr i8, i8* %25, i64 %112
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 %31, i32 8, i1 false)
  %indvars.iv.next127.3.1 = add nsw i64 %indvars.iv126, 8
  %exitcond129.3.1 = icmp eq i64 %indvars.iv.next127.3.1, %wide.trip.count128.3
  br i1 %exitcond129.3.1, label %.preheader69.unr-lcssa, label %._crit_edge90.us.3
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_cholesky(i32, [2000 x double]*) #0 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader41.preheader, label %._crit_edge48

.preheader41.preheader:                           ; preds = %2
  %wide.trip.count71 = zext i32 %0 to i64
  br label %.preheader41

.preheader41:                                     ; preds = %.preheader41.preheader, %._crit_edge46
  %indvars.iv69 = phi i64 [ %indvars.iv.next70, %._crit_edge46 ], [ 0, %.preheader41.preheader ]
  %4 = add i64 %indvars.iv69, -2
  %5 = add i64 %indvars.iv69, 4294967295
  %6 = icmp sgt i64 %indvars.iv69, 0
  br i1 %6, label %.preheader.preheader, label %._crit_edge46

.preheader.preheader:                             ; preds = %.preheader41
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv69, i64 0
  br label %.preheader

.preheader40:                                     ; preds = %._crit_edge
  %8 = icmp sgt i64 %indvars.iv69, 0
  br i1 %8, label %.lr.ph45, label %._crit_edge46

.lr.ph45:                                         ; preds = %.preheader40
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv69, i64 %indvars.iv69
  %xtraiter6573 = and i64 %indvars.iv69, 1
  %lcmp.mod66 = icmp eq i64 %xtraiter6573, 0
  br i1 %lcmp.mod66, label %.prol.loopexit64, label %.prol.preheader63

.prol.preheader63:                                ; preds = %.lr.ph45
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv69, i64 0
  %11 = load double, double* %10, align 8
  %12 = fmul double %11, %11
  %13 = load double, double* %9, align 8
  %14 = fsub double %13, %12
  store double %14, double* %9, align 8
  br label %.prol.loopexit64

.prol.loopexit64:                                 ; preds = %.prol.preheader63, %.lr.ph45
  %indvars.iv58.unr.ph = phi i64 [ 1, %.prol.preheader63 ], [ 0, %.lr.ph45 ]
  %15 = trunc i64 %5 to i32
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %._crit_edge46, label %.lr.ph45.new.preheader

.lr.ph45.new.preheader:                           ; preds = %.prol.loopexit64
  %17 = sub i64 %4, %indvars.iv58.unr.ph
  %18 = lshr i64 %17, 1
  %19 = and i64 %18, 1
  %lcmp.mod75 = icmp eq i64 %19, 0
  br i1 %lcmp.mod75, label %.lr.ph45.new.prol.preheader, label %.lr.ph45.new.prol.loopexit.unr-lcssa

.lr.ph45.new.prol.preheader:                      ; preds = %.lr.ph45.new.preheader
  br label %.lr.ph45.new.prol

.lr.ph45.new.prol:                                ; preds = %.lr.ph45.new.prol.preheader
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv69, i64 %indvars.iv58.unr.ph
  %21 = load double, double* %20, align 8
  %22 = fmul double %21, %21
  %23 = load double, double* %9, align 8
  %24 = fsub double %23, %22
  store double %24, double* %9, align 8
  %indvars.iv.next59.prol = add nuw nsw i64 %indvars.iv58.unr.ph, 1
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv69, i64 %indvars.iv.next59.prol
  %26 = load double, double* %25, align 8
  %27 = fmul double %26, %26
  %28 = fsub double %24, %27
  store double %28, double* %9, align 8
  %indvars.iv.next59.1.prol = or i64 %indvars.iv58.unr.ph, 2
  br label %.lr.ph45.new.prol.loopexit.unr-lcssa

.lr.ph45.new.prol.loopexit.unr-lcssa:             ; preds = %.lr.ph45.new.preheader, %.lr.ph45.new.prol
  %indvars.iv58.unr.ph76 = phi i64 [ %indvars.iv.next59.1.prol, %.lr.ph45.new.prol ], [ %indvars.iv58.unr.ph, %.lr.ph45.new.preheader ]
  br label %.lr.ph45.new.prol.loopexit

.lr.ph45.new.prol.loopexit:                       ; preds = %.lr.ph45.new.prol.loopexit.unr-lcssa
  %29 = icmp eq i64 %18, 0
  br i1 %29, label %._crit_edge46.loopexit, label %.lr.ph45.new.preheader.new

.lr.ph45.new.preheader.new:                       ; preds = %.lr.ph45.new.prol.loopexit
  br label %.lr.ph45.new

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv53 = phi i64 [ %indvars.iv.next54, %._crit_edge ], [ 0, %.preheader.preheader ]
  %30 = add i64 %indvars.iv53, 4294967295
  %31 = icmp sgt i64 %indvars.iv53, 0
  br i1 %31, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv69, i64 %indvars.iv53
  %xtraiter74 = and i64 %indvars.iv53, 1
  %lcmp.mod = icmp eq i64 %xtraiter74, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %33 = load double, double* %7, align 8
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv53, i64 0
  %35 = load double, double* %34, align 8
  %36 = fmul double %33, %35
  %37 = load double, double* %32, align 8
  %38 = fsub double %37, %36
  store double %38, double* %32, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %39 = trunc i64 %30 to i32
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv69, i64 %indvars.iv
  %42 = load double, double* %41, align 8
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv53, i64 %indvars.iv
  %44 = load double, double* %43, align 8
  %45 = fmul double %42, %44
  %46 = load double, double* %32, align 8
  %47 = fsub double %46, %45
  store double %47, double* %32, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv69, i64 %indvars.iv.next
  %49 = load double, double* %48, align 8
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv53, i64 %indvars.iv.next
  %51 = load double, double* %50, align 8
  %52 = fmul double %49, %51
  %53 = load double, double* %32, align 8
  %54 = fsub double %53, %52
  store double %54, double* %32, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv53
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %.preheader
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv53, i64 %indvars.iv53
  %56 = load double, double* %55, align 8
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv69, i64 %indvars.iv53
  %58 = load double, double* %57, align 8
  %59 = fdiv double %58, %56
  store double %59, double* %57, align 8
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond = icmp eq i64 %indvars.iv.next54, %indvars.iv69
  br i1 %exitcond, label %.preheader40, label %.preheader

.lr.ph45.new:                                     ; preds = %.lr.ph45.new, %.lr.ph45.new.preheader.new
  %indvars.iv58 = phi i64 [ %indvars.iv58.unr.ph76, %.lr.ph45.new.preheader.new ], [ %indvars.iv.next59.1.1, %.lr.ph45.new ]
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv69, i64 %indvars.iv58
  %61 = load double, double* %60, align 8
  %62 = fmul double %61, %61
  %63 = load double, double* %9, align 8
  %64 = fsub double %63, %62
  store double %64, double* %9, align 8
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %65 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv69, i64 %indvars.iv.next59
  %66 = load double, double* %65, align 8
  %67 = fmul double %66, %66
  %68 = fsub double %64, %67
  store double %68, double* %9, align 8
  %indvars.iv.next59.1 = add nsw i64 %indvars.iv58, 2
  %69 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv69, i64 %indvars.iv.next59.1
  %70 = load double, double* %69, align 8
  %71 = fmul double %70, %70
  %72 = fsub double %68, %71
  store double %72, double* %9, align 8
  %indvars.iv.next59.177 = add nsw i64 %indvars.iv58, 3
  %73 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv69, i64 %indvars.iv.next59.177
  %74 = load double, double* %73, align 8
  %75 = fmul double %74, %74
  %76 = fsub double %72, %75
  store double %76, double* %9, align 8
  %indvars.iv.next59.1.1 = add nsw i64 %indvars.iv58, 4
  %exitcond62.1.1 = icmp eq i64 %indvars.iv.next59.1.1, %indvars.iv69
  br i1 %exitcond62.1.1, label %._crit_edge46.loopexit.unr-lcssa, label %.lr.ph45.new

._crit_edge46.loopexit.unr-lcssa:                 ; preds = %.lr.ph45.new
  br label %._crit_edge46.loopexit

._crit_edge46.loopexit:                           ; preds = %.lr.ph45.new.prol.loopexit, %._crit_edge46.loopexit.unr-lcssa
  br label %._crit_edge46

._crit_edge46:                                    ; preds = %._crit_edge46.loopexit, %.preheader41, %.prol.loopexit64, %.preheader40
  %77 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv69, i64 %indvars.iv69
  %78 = load double, double* %77, align 8
  %79 = tail call double @sqrt(double %78) #4
  store double %79, double* %77, align 8
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond72 = icmp eq i64 %indvars.iv.next70, %wide.trip.count71
  br i1 %exitcond72, label %._crit_edge48.loopexit, label %.preheader41

._crit_edge48.loopexit:                           ; preds = %._crit_edge46
  br label %._crit_edge48

._crit_edge48:                                    ; preds = %._crit_edge48.loopexit, %2
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [2000 x double]*) #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.preheader, label %._crit_edge13

.preheader.preheader:                             ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count20 = zext i32 %0 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv18 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next19, %._crit_edge ]
  %indvars.iv16 = phi i64 [ 1, %.preheader.preheader ], [ %indvars.iv.next17, %._crit_edge ]
  %9 = mul nsw i64 %indvars.iv18, %8
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
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv18, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %indvars.iv16
  br i1 %exitcond, label %._crit_edge, label %10

._crit_edge:                                      ; preds = %17
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next19, %wide.trip.count20
  br i1 %exitcond21, label %._crit_edge13.loopexit, label %.lr.ph

._crit_edge13.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %2
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
