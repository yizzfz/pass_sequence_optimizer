; ModuleID = 'A.ll'
source_filename = "lu.c"
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
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #5
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call void @init_array(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #5
  tail call void @kernel_lu(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #5
  tail call void (...) @polybench_timer_print() #5
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
  tail call void @free(i8* %3) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32, [2000 x double]*) #0 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader71.lr.ph, label %._crit_edge100.thread

._crit_edge100.thread:                            ; preds = %2
  %4 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #5
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
  %25 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #5
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
  tail call void @free(i8* %98) #5
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

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_lu(i32, [2000 x double]*) #2 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader43.preheader, label %._crit_edge54

.preheader43.preheader:                           ; preds = %2
  %wide.trip.count85 = zext i32 %0 to i64
  %wide.trip.count79 = zext i32 %0 to i64
  br label %.preheader43

.preheader43:                                     ; preds = %.preheader43.preheader, %._crit_edge50
  %indvars.iv83 = phi i64 [ %indvars.iv.next84, %._crit_edge50 ], [ 0, %.preheader43.preheader ]
  %4 = add i64 %indvars.iv83, 4294967295
  %5 = icmp sgt i64 %indvars.iv83, 0
  br i1 %5, label %.preheader41.preheader, label %._crit_edge50

.preheader41.preheader:                           ; preds = %.preheader43
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv83, i64 0
  br label %.preheader41

.preheader.lr.ph:                                 ; preds = %._crit_edge
  %7 = icmp sgt i64 %indvars.iv83, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge50

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %xtraiter7387 = and i64 %indvars.iv83, 1
  %lcmp.mod74 = icmp eq i64 %xtraiter7387, 0
  %8 = trunc i64 %4 to i32
  %9 = icmp eq i32 %8, 0
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv83, i64 0
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge48.us
  %indvars.iv77 = phi i64 [ %indvars.iv.next78, %._crit_edge48.us ], [ %indvars.iv83, %.preheader.us.preheader ]
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv83, i64 %indvars.iv77
  br i1 %lcmp.mod74, label %.prol.loopexit72, label %.prol.preheader71

.prol.preheader71:                                ; preds = %.preheader.us
  %12 = load double, double* %10, align 8
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv77
  %14 = load double, double* %13, align 8
  %15 = fmul double %12, %14
  %16 = load double, double* %11, align 8
  %17 = fsub double %16, %15
  store double %17, double* %11, align 8
  br label %.prol.loopexit72

.prol.loopexit72:                                 ; preds = %.prol.preheader71, %.preheader.us
  %indvars.iv66.unr.ph = phi i64 [ 1, %.prol.preheader71 ], [ 0, %.preheader.us ]
  br i1 %9, label %._crit_edge48.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit72
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv66 = phi i64 [ %indvars.iv.next67.1, %.preheader.us.new ], [ %indvars.iv66.unr.ph, %.preheader.us.new.preheader ]
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv83, i64 %indvars.iv66
  %19 = load double, double* %18, align 8
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv66, i64 %indvars.iv77
  %21 = load double, double* %20, align 8
  %22 = fmul double %19, %21
  %23 = load double, double* %11, align 8
  %24 = fsub double %23, %22
  store double %24, double* %11, align 8
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv83, i64 %indvars.iv.next67
  %26 = load double, double* %25, align 8
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next67, i64 %indvars.iv77
  %28 = load double, double* %27, align 8
  %29 = fmul double %26, %28
  %30 = load double, double* %11, align 8
  %31 = fsub double %30, %29
  store double %31, double* %11, align 8
  %indvars.iv.next67.1 = add nsw i64 %indvars.iv66, 2
  %exitcond70.1 = icmp eq i64 %indvars.iv.next67.1, %indvars.iv83
  br i1 %exitcond70.1, label %._crit_edge48.us.loopexit, label %.preheader.us.new

._crit_edge48.us.loopexit:                        ; preds = %.preheader.us.new
  br label %._crit_edge48.us

._crit_edge48.us:                                 ; preds = %._crit_edge48.us.loopexit, %.prol.loopexit72
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1
  %exitcond80 = icmp eq i64 %indvars.iv.next78, %wide.trip.count79
  br i1 %exitcond80, label %._crit_edge50.loopexit, label %.preheader.us

.preheader41:                                     ; preds = %.preheader41.preheader, %._crit_edge
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %._crit_edge ], [ 0, %.preheader41.preheader ]
  %32 = add i64 %indvars.iv60, 4294967295
  %33 = icmp sgt i64 %indvars.iv60, 0
  br i1 %33, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader41
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv83, i64 %indvars.iv60
  %xtraiter88 = and i64 %indvars.iv60, 1
  %lcmp.mod = icmp eq i64 %xtraiter88, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %35 = load double, double* %6, align 8
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv60
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
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv83, i64 %indvars.iv
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv, i64 %indvars.iv60
  %46 = load double, double* %45, align 8
  %47 = fmul double %44, %46
  %48 = load double, double* %34, align 8
  %49 = fsub double %48, %47
  store double %49, double* %34, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv83, i64 %indvars.iv.next
  %51 = load double, double* %50, align 8
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv60
  %53 = load double, double* %52, align 8
  %54 = fmul double %51, %53
  %55 = load double, double* %34, align 8
  %56 = fsub double %55, %54
  store double %56, double* %34, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv60
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %.preheader41
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv60, i64 %indvars.iv60
  %58 = load double, double* %57, align 8
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv83, i64 %indvars.iv60
  %60 = load double, double* %59, align 8
  %61 = fdiv double %60, %58
  store double %61, double* %59, align 8
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond = icmp eq i64 %indvars.iv.next61, %indvars.iv83
  br i1 %exitcond, label %.preheader.lr.ph, label %.preheader41

._crit_edge50.loopexit:                           ; preds = %._crit_edge48.us
  br label %._crit_edge50

._crit_edge50:                                    ; preds = %._crit_edge50.loopexit, %.preheader43, %.preheader.lr.ph
  %indvars.iv.next84 = add nuw nsw i64 %indvars.iv83, 1
  %exitcond86 = icmp eq i64 %indvars.iv.next84, %wide.trip.count85
  br i1 %exitcond86, label %._crit_edge54.loopexit, label %.preheader43

._crit_edge54.loopexit:                           ; preds = %._crit_edge50
  br label %._crit_edge54

._crit_edge54:                                    ; preds = %._crit_edge54.loopexit, %2
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [2000 x double]*) #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge13

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count16 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv14 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next15, %._crit_edge.us ]
  %9 = mul nsw i64 %indvars.iv14, %8
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
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv14, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %10

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next15, %wide.trip.count16
  br i1 %exitcond17, label %._crit_edge13.loopexit, label %.preheader.us

._crit_edge13.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %2
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #5

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { nounwind }
attributes #6 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
