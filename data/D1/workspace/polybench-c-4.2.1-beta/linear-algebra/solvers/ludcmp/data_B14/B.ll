; ModuleID = 'A.ll'
source_filename = "ludcmp.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %7 = bitcast i8* %3 to [2000 x double]*
  %8 = bitcast i8* %4 to double*
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  tail call void @init_array(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  tail call void @kernel_ludcmp(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %16

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %16

; <label>:15:                                     ; preds = %12
  tail call void @print_array(i32 2000, double* %9)
  br label %16

; <label>:16:                                     ; preds = %12, %15, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32, [2000 x double]*, double*, double*, double*) #0 {
.lr.ph106.preheader:
  br label %.lr.ph106

.lr.ph106:                                        ; preds = %.lr.ph106.preheader, %.lr.ph106
  %indvars.iv159 = phi i64 [ %indvars.iv.next160.1, %.lr.ph106 ], [ 0, %.lr.ph106.preheader ]
  %5 = getelementptr inbounds double, double* %3, i64 %indvars.iv159
  store double 0.000000e+00, double* %5, align 8
  %6 = getelementptr inbounds double, double* %4, i64 %indvars.iv159
  store double 0.000000e+00, double* %6, align 8
  %indvars.iv.next160 = or i64 %indvars.iv159, 1
  %7 = trunc i64 %indvars.iv.next160 to i32
  %8 = sitofp i32 %7 to double
  %9 = fdiv double %8, 2.000000e+03
  %10 = fmul double %9, 5.000000e-01
  %11 = fadd double %10, 4.000000e+00
  %12 = getelementptr inbounds double, double* %2, i64 %indvars.iv159
  store double %11, double* %12, align 8
  %13 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next160
  store double 0.000000e+00, double* %13, align 8
  %14 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next160
  store double 0.000000e+00, double* %14, align 8
  %indvars.iv.next160.1 = add nsw i64 %indvars.iv159, 2
  %15 = trunc i64 %indvars.iv.next160.1 to i32
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, 2.000000e+03
  %18 = fmul double %17, 5.000000e-01
  %19 = fadd double %18, 4.000000e+00
  %20 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next160
  store double %19, double* %20, align 8
  %exitcond162.1 = icmp eq i64 %indvars.iv.next160.1, 2000
  br i1 %exitcond162.1, label %.lr.ph97.preheader, label %.lr.ph106

.lr.ph97.preheader:                               ; preds = %.lr.ph106
  br label %.lr.ph97

.lr.ph97:                                         ; preds = %.lr.ph97.preheader, %._crit_edge101
  %indvars.iv155 = phi i64 [ %indvars.iv.next156, %._crit_edge101 ], [ 0, %.lr.ph97.preheader ]
  %indvars.iv153 = phi i64 [ %indvars.iv.next154, %._crit_edge101 ], [ 1, %.lr.ph97.preheader ]
  %21 = mul nuw nsw i64 %indvars.iv155, 2001
  %22 = add nuw nsw i64 %21, 1
  %scevgep151 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %22
  %scevgep151152 = bitcast double* %scevgep151 to i8*
  %23 = sub i64 1998, %indvars.iv155
  %24 = shl i64 %23, 3
  %25 = and i64 %24, 34359738360
  %26 = add nuw nsw i64 %25, 8
  br label %28

.preheader73:                                     ; preds = %28
  %indvars.iv.next156 = add nuw nsw i64 %indvars.iv155, 1
  %27 = icmp slt i64 %indvars.iv.next156, 2000
  br i1 %27, label %._crit_edge101.loopexit, label %._crit_edge101

; <label>:28:                                     ; preds = %28, %.lr.ph97
  %indvars.iv139 = phi i64 [ %indvars.iv.next140, %28 ], [ 0, %.lr.ph97 ]
  %29 = sub nsw i64 0, %indvars.iv139
  %30 = trunc i64 %29 to i32
  %31 = srem i32 %30, 2000
  %32 = sitofp i32 %31 to double
  %33 = fdiv double %32, 2.000000e+03
  %34 = fadd double %33, 1.000000e+00
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv155, i64 %indvars.iv139
  store double %34, double* %35, align 8
  %indvars.iv.next140 = add nuw nsw i64 %indvars.iv139, 1
  %exitcond144 = icmp eq i64 %indvars.iv.next140, %indvars.iv153
  br i1 %exitcond144, label %.preheader73, label %28

._crit_edge101.loopexit:                          ; preds = %.preheader73
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep151152, i8 0, i64 %26, i32 8, i1 false)
  br label %._crit_edge101

._crit_edge101:                                   ; preds = %._crit_edge101.loopexit, %.preheader73
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv155, i64 %indvars.iv155
  store double 1.000000e+00, double* %36, align 8
  %indvars.iv.next154 = add nuw nsw i64 %indvars.iv153, 1
  %exitcond158 = icmp eq i64 %indvars.iv.next156, 2000
  br i1 %exitcond158, label %._crit_edge103, label %.lr.ph97

._crit_edge103:                                   ; preds = %._crit_edge101
  %37 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %38 = bitcast i8* %37 to [2000 x [2000 x double]]*
  br label %._crit_edge94.us.3

.preheader69.us.us.preheader:                     ; preds = %.preheader69.us.us.preheader.preheader, %._crit_edge83.us
  %indvars.iv124 = phi i64 [ %indvars.iv.next125, %._crit_edge83.us ], [ 0, %.preheader69.us.us.preheader.preheader ]
  br label %.preheader69.us.us

._crit_edge83.us:                                 ; preds = %._crit_edge81.us.us
  %indvars.iv.next125 = add nuw nsw i64 %indvars.iv124, 1
  %exitcond127 = icmp eq i64 %indvars.iv.next125, 2000
  br i1 %exitcond127, label %.preheader.us.preheader, label %.preheader69.us.us.preheader

.preheader.us.preheader:                          ; preds = %._crit_edge83.us
  br label %.preheader.us

.preheader69.us.us:                               ; preds = %._crit_edge81.us.us, %.preheader69.us.us.preheader
  %indvars.iv120 = phi i64 [ 0, %.preheader69.us.us.preheader ], [ %indvars.iv.next121, %._crit_edge81.us.us ]
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv120, i64 %indvars.iv124
  br label %.preheader69.us.us.new

._crit_edge81.us.us:                              ; preds = %.preheader69.us.us.new
  %indvars.iv.next121 = add nuw nsw i64 %indvars.iv120, 1
  %exitcond123 = icmp eq i64 %indvars.iv.next121, 2000
  br i1 %exitcond123, label %._crit_edge83.us, label %.preheader69.us.us

.preheader69.us.us.new:                           ; preds = %.preheader69.us.us, %.preheader69.us.us.new
  %indvars.iv112 = phi i64 [ %indvars.iv.next113.1, %.preheader69.us.us.new ], [ 0, %.preheader69.us.us ]
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv112, i64 %indvars.iv124
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv120, i64 %indvars.iv112
  %45 = load double, double* %44, align 8
  %46 = fadd double %45, %43
  store double %46, double* %44, align 8
  %indvars.iv.next113 = or i64 %indvars.iv112, 1
  %47 = load double, double* %39, align 8
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next113, i64 %indvars.iv124
  %49 = load double, double* %48, align 8
  %50 = fmul double %47, %49
  %51 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv120, i64 %indvars.iv.next113
  %52 = load double, double* %51, align 8
  %53 = fadd double %52, %50
  store double %53, double* %51, align 8
  %indvars.iv.next113.1 = add nsw i64 %indvars.iv112, 2
  %exitcond115.1 = icmp eq i64 %indvars.iv.next113.1, 2000
  br i1 %exitcond115.1, label %._crit_edge81.us.us, label %.preheader69.us.us.new

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv109 = phi i64 [ %indvars.iv.next110, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader.us.new ], [ 0, %.preheader.us ]
  %54 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv109, i64 %indvars.iv
  %55 = bitcast double* %54 to i64*
  %56 = load i64, i64* %55, align 8
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv109, i64 %indvars.iv
  %58 = bitcast double* %57 to i64*
  store i64 %56, i64* %58, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %59 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv109, i64 %indvars.iv.next
  %60 = bitcast double* %59 to i64*
  %61 = load i64, i64* %60, align 8
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv109, i64 %indvars.iv.next
  %63 = bitcast double* %62 to i64*
  store i64 %61, i64* %63, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %64 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv109, i64 %indvars.iv.next.1
  %65 = bitcast double* %64 to i64*
  %66 = load i64, i64* %65, align 8
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv109, i64 %indvars.iv.next.1
  %68 = bitcast double* %67 to i64*
  store i64 %66, i64* %68, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %69 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv109, i64 %indvars.iv.next.2
  %70 = bitcast double* %69 to i64*
  %71 = load i64, i64* %70, align 8
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv109, i64 %indvars.iv.next.2
  %73 = bitcast double* %72 to i64*
  store i64 %71, i64* %73, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond.3, label %._crit_edge.us, label %.preheader.us.new

._crit_edge.us:                                   ; preds = %.preheader.us.new
  %indvars.iv.next110 = add nuw nsw i64 %indvars.iv109, 1
  %exitcond = icmp eq i64 %indvars.iv.next110, 2000
  br i1 %exitcond, label %._crit_edge78, label %.preheader.us

._crit_edge78:                                    ; preds = %._crit_edge.us
  tail call void @free(i8* %37) #4
  ret void

._crit_edge94.us.3:                               ; preds = %._crit_edge94.us.3, %._crit_edge103
  %indvars.iv132 = phi i64 [ 0, %._crit_edge103 ], [ %indvars.iv.next133.3.1, %._crit_edge94.us.3 ]
  %74 = mul nuw nsw i64 %indvars.iv132, 16000
  %scevgep = getelementptr i8, i8* %37, i64 %74
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %75 = mul nuw nsw i64 %indvars.iv132, 16000
  %76 = add nuw nsw i64 %75, 16000
  %scevgep.1 = getelementptr i8, i8* %37, i64 %76
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %77 = mul nuw nsw i64 %indvars.iv132, 16000
  %78 = add nuw nsw i64 %77, 32000
  %scevgep.2 = getelementptr i8, i8* %37, i64 %78
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %79 = mul nuw nsw i64 %indvars.iv132, 16000
  %80 = add nuw nsw i64 %79, 48000
  %scevgep.3 = getelementptr i8, i8* %37, i64 %80
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next133.3 = or i64 %indvars.iv132, 4
  %81 = mul nuw nsw i64 %indvars.iv.next133.3, 16000
  %scevgep.1184 = getelementptr i8, i8* %37, i64 %81
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1184, i8 0, i64 16000, i32 8, i1 false)
  %82 = mul nuw nsw i64 %indvars.iv.next133.3, 16000
  %83 = add nuw nsw i64 %82, 16000
  %scevgep.1.1 = getelementptr i8, i8* %37, i64 %83
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 16000, i32 8, i1 false)
  %84 = mul nuw nsw i64 %indvars.iv.next133.3, 16000
  %85 = add nuw nsw i64 %84, 32000
  %scevgep.2.1 = getelementptr i8, i8* %37, i64 %85
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 16000, i32 8, i1 false)
  %86 = mul nuw nsw i64 %indvars.iv.next133.3, 16000
  %87 = add nuw nsw i64 %86, 48000
  %scevgep.3.1 = getelementptr i8, i8* %37, i64 %87
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next133.3.1 = add nsw i64 %indvars.iv132, 8
  %exitcond135.3.1 = icmp eq i64 %indvars.iv.next133.3.1, 2000
  br i1 %exitcond135.3.1, label %.preheader69.us.us.preheader.preheader, label %._crit_edge94.us.3

.preheader69.us.us.preheader.preheader:           ; preds = %._crit_edge94.us.3
  br label %.preheader69.us.us.preheader
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_ludcmp(i32, [2000 x double]*, double*, double*, double*) #2 {
.preheader77.preheader:
  br label %.preheader77

.preheader77:                                     ; preds = %.preheader77.preheader, %._crit_edge113
  %indvars.iv169 = phi i64 [ %indvars.iv.next170, %._crit_edge113 ], [ 0, %.preheader77.preheader ]
  %5 = add i64 %indvars.iv169, 4294967295
  %6 = icmp sgt i64 %indvars.iv169, 0
  br i1 %6, label %.lr.ph105.preheader, label %._crit_edge113

.lr.ph105.preheader:                              ; preds = %.preheader77
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv169, i64 0
  br label %.lr.ph105

.lr.ph112:                                        ; preds = %._crit_edge102
  %8 = icmp sgt i64 %indvars.iv169, 0
  br i1 %8, label %.lr.ph112.split.us.preheader, label %._crit_edge113

.lr.ph112.split.us.preheader:                     ; preds = %.lr.ph112
  %xtraiter158173 = and i64 %indvars.iv169, 1
  %lcmp.mod159 = icmp eq i64 %xtraiter158173, 0
  %9 = trunc i64 %5 to i32
  %10 = icmp eq i32 %9, 0
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv169, i64 0
  br label %.lr.ph112.split.us

.lr.ph112.split.us:                               ; preds = %.lr.ph112.split.us.preheader, %._crit_edge109.us
  %indvars.iv163 = phi i64 [ %indvars.iv.next164, %._crit_edge109.us ], [ %indvars.iv169, %.lr.ph112.split.us.preheader ]
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv169, i64 %indvars.iv163
  %13 = load double, double* %12, align 8
  br i1 %lcmp.mod159, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph112.split.us
  %14 = load double, double* %11, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv163
  %16 = load double, double* %15, align 8
  %17 = fmul double %14, %16
  %18 = fsub double %13, %17
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph112.split.us
  %indvars.iv153.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph112.split.us ]
  %.unr160.ph = phi double [ %18, %.prol.preheader ], [ %13, %.lr.ph112.split.us ]
  %.lcssa121.unr.ph = phi double [ %18, %.prol.preheader ], [ undef, %.lr.ph112.split.us ]
  br i1 %10, label %._crit_edge109.us, label %.lr.ph112.split.us.new.preheader

.lr.ph112.split.us.new.preheader:                 ; preds = %.prol.loopexit
  br label %.lr.ph112.split.us.new

.lr.ph112.split.us.new:                           ; preds = %.lr.ph112.split.us.new.preheader, %.lr.ph112.split.us.new
  %indvars.iv153 = phi i64 [ %indvars.iv.next154.1, %.lr.ph112.split.us.new ], [ %indvars.iv153.unr.ph, %.lr.ph112.split.us.new.preheader ]
  %19 = phi double [ %31, %.lr.ph112.split.us.new ], [ %.unr160.ph, %.lr.ph112.split.us.new.preheader ]
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv169, i64 %indvars.iv153
  %21 = load double, double* %20, align 8
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv153, i64 %indvars.iv163
  %23 = load double, double* %22, align 8
  %24 = fmul double %21, %23
  %25 = fsub double %19, %24
  %indvars.iv.next154 = add nuw nsw i64 %indvars.iv153, 1
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv169, i64 %indvars.iv.next154
  %27 = load double, double* %26, align 8
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next154, i64 %indvars.iv163
  %29 = load double, double* %28, align 8
  %30 = fmul double %27, %29
  %31 = fsub double %25, %30
  %indvars.iv.next154.1 = add nsw i64 %indvars.iv153, 2
  %exitcond157.1 = icmp eq i64 %indvars.iv.next154.1, %indvars.iv169
  br i1 %exitcond157.1, label %._crit_edge109.us.loopexit, label %.lr.ph112.split.us.new

._crit_edge109.us.loopexit:                       ; preds = %.lr.ph112.split.us.new
  br label %._crit_edge109.us

._crit_edge109.us:                                ; preds = %._crit_edge109.us.loopexit, %.prol.loopexit
  %.lcssa121 = phi double [ %.lcssa121.unr.ph, %.prol.loopexit ], [ %31, %._crit_edge109.us.loopexit ]
  store double %.lcssa121, double* %12, align 8
  %indvars.iv.next164 = add nuw nsw i64 %indvars.iv163, 1
  %exitcond166 = icmp eq i64 %indvars.iv.next164, 2000
  br i1 %exitcond166, label %._crit_edge113.loopexit, label %.lr.ph112.split.us

.lr.ph105:                                        ; preds = %.lr.ph105.preheader, %._crit_edge102
  %indvars.iv146 = phi i64 [ %indvars.iv.next147, %._crit_edge102 ], [ 0, %.lr.ph105.preheader ]
  %32 = add i64 %indvars.iv146, 4294967295
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv169, i64 %indvars.iv146
  %34 = bitcast double* %33 to i64*
  %35 = load i64, i64* %34, align 8
  %36 = bitcast i64 %35 to double
  %37 = icmp sgt i64 %indvars.iv146, 0
  br i1 %37, label %.lr.ph101.preheader, label %._crit_edge102

.lr.ph101.preheader:                              ; preds = %.lr.ph105
  %xtraiter142174 = and i64 %indvars.iv146, 1
  %lcmp.mod143 = icmp eq i64 %xtraiter142174, 0
  br i1 %lcmp.mod143, label %.lr.ph101.prol.loopexit, label %.lr.ph101.prol

.lr.ph101.prol:                                   ; preds = %.lr.ph101.preheader
  %38 = load double, double* %7, align 8
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv146
  %40 = load double, double* %39, align 8
  %41 = fmul double %38, %40
  %42 = bitcast i64 %35 to double
  %43 = fsub double %42, %41
  %44 = bitcast double %43 to i64
  br label %.lr.ph101.prol.loopexit

.lr.ph101.prol.loopexit:                          ; preds = %.lr.ph101.prol, %.lr.ph101.preheader
  %indvars.iv137.unr.ph = phi i64 [ 1, %.lr.ph101.prol ], [ 0, %.lr.ph101.preheader ]
  %.sroa.0.098.unr.ph = phi i64 [ %44, %.lr.ph101.prol ], [ %35, %.lr.ph101.preheader ]
  %.lcssa120.unr.ph = phi double [ %43, %.lr.ph101.prol ], [ undef, %.lr.ph101.preheader ]
  %45 = trunc i64 %32 to i32
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %._crit_edge102, label %.lr.ph101.preheader193

.lr.ph101.preheader193:                           ; preds = %.lr.ph101.prol.loopexit
  br label %.lr.ph101

.lr.ph101:                                        ; preds = %.lr.ph101.preheader193, %.lr.ph101
  %indvars.iv137 = phi i64 [ %indvars.iv.next138.1, %.lr.ph101 ], [ %indvars.iv137.unr.ph, %.lr.ph101.preheader193 ]
  %.sroa.0.098 = phi i64 [ %60, %.lr.ph101 ], [ %.sroa.0.098.unr.ph, %.lr.ph101.preheader193 ]
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv169, i64 %indvars.iv137
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv146
  %50 = load double, double* %49, align 8
  %51 = fmul double %48, %50
  %52 = bitcast i64 %.sroa.0.098 to double
  %53 = fsub double %52, %51
  %indvars.iv.next138 = add nuw nsw i64 %indvars.iv137, 1
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv169, i64 %indvars.iv.next138
  %55 = load double, double* %54, align 8
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next138, i64 %indvars.iv146
  %57 = load double, double* %56, align 8
  %58 = fmul double %55, %57
  %59 = fsub double %53, %58
  %60 = bitcast double %59 to i64
  %indvars.iv.next138.1 = add nsw i64 %indvars.iv137, 2
  %exitcond141.1 = icmp eq i64 %indvars.iv.next138.1, %indvars.iv146
  br i1 %exitcond141.1, label %._crit_edge102.loopexit, label %.lr.ph101

._crit_edge102.loopexit:                          ; preds = %.lr.ph101
  br label %._crit_edge102

._crit_edge102:                                   ; preds = %._crit_edge102.loopexit, %.lr.ph101.prol.loopexit, %.lr.ph105
  %.lcssa82 = phi double [ %36, %.lr.ph105 ], [ %.lcssa120.unr.ph, %.lr.ph101.prol.loopexit ], [ %59, %._crit_edge102.loopexit ]
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv146, i64 %indvars.iv146
  %62 = load double, double* %61, align 8
  %63 = fdiv double %.lcssa82, %62
  store double %63, double* %33, align 8
  %indvars.iv.next147 = add nuw nsw i64 %indvars.iv146, 1
  %exitcond151 = icmp eq i64 %indvars.iv.next147, %indvars.iv169
  br i1 %exitcond151, label %.lr.ph112, label %.lr.ph105

._crit_edge113.loopexit:                          ; preds = %._crit_edge109.us
  br label %._crit_edge113

._crit_edge113:                                   ; preds = %._crit_edge113.loopexit, %.preheader77, %.lr.ph112
  %indvars.iv.next170 = add nuw nsw i64 %indvars.iv169, 1
  %exitcond172 = icmp eq i64 %indvars.iv.next170, 2000
  br i1 %exitcond172, label %.lr.ph97.preheader, label %.preheader77

.lr.ph97.preheader:                               ; preds = %._crit_edge113
  br label %.lr.ph97

.lr.ph97:                                         ; preds = %.lr.ph97.preheader, %._crit_edge94
  %indvars.iv134 = phi i64 [ %indvars.iv.next135, %._crit_edge94 ], [ 0, %.lr.ph97.preheader ]
  %64 = add i64 %indvars.iv134, 4294967295
  %65 = getelementptr inbounds double, double* %2, i64 %indvars.iv134
  %66 = load double, double* %65, align 8
  %67 = icmp sgt i64 %indvars.iv134, 0
  br i1 %67, label %.lr.ph93.preheader, label %._crit_edge94

.lr.ph93.preheader:                               ; preds = %.lr.ph97
  %68 = trunc i64 %indvars.iv134 to i32
  %xtraiter128 = and i32 %68, 3
  %lcmp.mod129 = icmp eq i32 %xtraiter128, 0
  br i1 %lcmp.mod129, label %.lr.ph93.prol.loopexit, label %.lr.ph93.prol.preheader

.lr.ph93.prol.preheader:                          ; preds = %.lr.ph93.preheader
  br label %.lr.ph93.prol

.lr.ph93.prol:                                    ; preds = %.lr.ph93.prol.preheader, %.lr.ph93.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.lr.ph93.prol ], [ 0, %.lr.ph93.prol.preheader ]
  %69 = phi double [ %75, %.lr.ph93.prol ], [ %66, %.lr.ph93.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph93.prol ], [ %xtraiter128, %.lr.ph93.prol.preheader ]
  %70 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv134, i64 %indvars.iv.prol
  %71 = load double, double* %70, align 8
  %72 = getelementptr inbounds double, double* %4, i64 %indvars.iv.prol
  %73 = load double, double* %72, align 8
  %74 = fmul double %71, %73
  %75 = fsub double %69, %74
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph93.prol.loopexit.loopexit, label %.lr.ph93.prol, !llvm.loop !1

.lr.ph93.prol.loopexit.loopexit:                  ; preds = %.lr.ph93.prol
  br label %.lr.ph93.prol.loopexit

.lr.ph93.prol.loopexit:                           ; preds = %.lr.ph93.prol.loopexit.loopexit, %.lr.ph93.preheader
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph93.preheader ], [ %indvars.iv.next.prol, %.lr.ph93.prol.loopexit.loopexit ]
  %.unr = phi double [ %66, %.lr.ph93.preheader ], [ %75, %.lr.ph93.prol.loopexit.loopexit ]
  %.lcssa119.unr = phi double [ undef, %.lr.ph93.preheader ], [ %75, %.lr.ph93.prol.loopexit.loopexit ]
  %76 = trunc i64 %64 to i32
  %77 = icmp ult i32 %76, 3
  br i1 %77, label %._crit_edge94, label %.lr.ph93.preheader192

.lr.ph93.preheader192:                            ; preds = %.lr.ph93.prol.loopexit
  br label %.lr.ph93

.lr.ph93:                                         ; preds = %.lr.ph93.preheader192, %.lr.ph93
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph93 ], [ %indvars.iv.unr, %.lr.ph93.preheader192 ]
  %78 = phi double [ %102, %.lr.ph93 ], [ %.unr, %.lr.ph93.preheader192 ]
  %79 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv134, i64 %indvars.iv
  %80 = load double, double* %79, align 8
  %81 = getelementptr inbounds double, double* %4, i64 %indvars.iv
  %82 = load double, double* %81, align 8
  %83 = fmul double %80, %82
  %84 = fsub double %78, %83
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %85 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv134, i64 %indvars.iv.next
  %86 = load double, double* %85, align 8
  %87 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next
  %88 = load double, double* %87, align 8
  %89 = fmul double %86, %88
  %90 = fsub double %84, %89
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %91 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv134, i64 %indvars.iv.next.1
  %92 = load double, double* %91, align 8
  %93 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next.1
  %94 = load double, double* %93, align 8
  %95 = fmul double %92, %94
  %96 = fsub double %90, %95
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %97 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv134, i64 %indvars.iv.next.2
  %98 = load double, double* %97, align 8
  %99 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next.2
  %100 = load double, double* %99, align 8
  %101 = fmul double %98, %100
  %102 = fsub double %96, %101
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv134
  br i1 %exitcond.3, label %._crit_edge94.loopexit, label %.lr.ph93

._crit_edge94.loopexit:                           ; preds = %.lr.ph93
  br label %._crit_edge94

._crit_edge94:                                    ; preds = %._crit_edge94.loopexit, %.lr.ph93.prol.loopexit, %.lr.ph97
  %.lcssa81 = phi double [ %66, %.lr.ph97 ], [ %.lcssa119.unr, %.lr.ph93.prol.loopexit ], [ %102, %._crit_edge94.loopexit ]
  %103 = getelementptr inbounds double, double* %4, i64 %indvars.iv134
  store double %.lcssa81, double* %103, align 8
  %indvars.iv.next135 = add nuw nsw i64 %indvars.iv134, 1
  %exitcond = icmp eq i64 %indvars.iv.next135, 2000
  br i1 %exitcond, label %.lr.ph89.preheader, label %.lr.ph97

.lr.ph89.preheader:                               ; preds = %._crit_edge94
  br label %.lr.ph89

.lr.ph89:                                         ; preds = %.lr.ph89.preheader, %._crit_edge
  %indvars.iv124 = phi i64 [ %indvars.iv.next125, %._crit_edge ], [ 2000, %.lr.ph89.preheader ]
  %indvar = phi i32 [ %indvar.next, %._crit_edge ], [ 0, %.lr.ph89.preheader ]
  %indvars.iv.next125 = add nsw i64 %indvars.iv124, -1
  %104 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next125
  %105 = bitcast double* %104 to i64*
  %106 = load i64, i64* %105, align 8
  %107 = bitcast i64 %106 to double
  %108 = icmp slt i64 %indvars.iv124, 2000
  br i1 %108, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.lr.ph89
  %xtraiter = and i32 %indvar, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.preheader
  %109 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next125, i64 %indvars.iv124
  %110 = load double, double* %109, align 8
  %111 = getelementptr inbounds double, double* %3, i64 %indvars.iv124
  %112 = load double, double* %111, align 8
  %113 = fmul double %110, %112
  %114 = bitcast i64 %106 to double
  %115 = fsub double %114, %113
  %116 = bitcast double %115 to i64
  %indvars.iv.next123.prol = add nsw i64 %indvars.iv124, 1
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol, %.lr.ph.preheader
  %indvars.iv122.unr.ph = phi i64 [ %indvars.iv.next123.prol, %.lr.ph.prol ], [ %indvars.iv124, %.lr.ph.preheader ]
  %.sroa.0.385.unr.ph = phi i64 [ %116, %.lr.ph.prol ], [ %106, %.lr.ph.preheader ]
  %.lcssa118.unr.ph = phi double [ %115, %.lr.ph.prol ], [ undef, %.lr.ph.preheader ]
  %117 = icmp eq i32 %indvar, 1
  br i1 %117, label %._crit_edge, label %.lr.ph.preheader191

.lr.ph.preheader191:                              ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader191, %.lr.ph
  %indvars.iv122 = phi i64 [ %indvars.iv.next123.1, %.lr.ph ], [ %indvars.iv122.unr.ph, %.lr.ph.preheader191 ]
  %.sroa.0.385 = phi i64 [ %131, %.lr.ph ], [ %.sroa.0.385.unr.ph, %.lr.ph.preheader191 ]
  %118 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next125, i64 %indvars.iv122
  %119 = load double, double* %118, align 8
  %120 = getelementptr inbounds double, double* %3, i64 %indvars.iv122
  %121 = load double, double* %120, align 8
  %122 = fmul double %119, %121
  %123 = bitcast i64 %.sroa.0.385 to double
  %124 = fsub double %123, %122
  %indvars.iv.next123 = add nsw i64 %indvars.iv122, 1
  %125 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next125, i64 %indvars.iv.next123
  %126 = load double, double* %125, align 8
  %127 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next123
  %128 = load double, double* %127, align 8
  %129 = fmul double %126, %128
  %130 = fsub double %124, %129
  %131 = bitcast double %130 to i64
  %indvars.iv.next123.1 = add nsw i64 %indvars.iv122, 2
  %lftr.wideiv.1 = trunc i64 %indvars.iv.next123.1 to i32
  %exitcond.1 = icmp eq i32 %lftr.wideiv.1, 2000
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %.lr.ph89
  %.lcssa = phi double [ %107, %.lr.ph89 ], [ %.lcssa118.unr.ph, %.lr.ph.prol.loopexit ], [ %130, %._crit_edge.loopexit ]
  %132 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next125, i64 %indvars.iv.next125
  %133 = load double, double* %132, align 8
  %134 = fdiv double %.lcssa, %133
  %135 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next125
  store double %134, double* %135, align 8
  %136 = icmp sgt i64 %indvars.iv124, 1
  %indvar.next = add nuw nsw i32 %indvar, 1
  br i1 %136, label %.lr.ph89, label %._crit_edge90

._crit_edge90:                                    ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, double*) #0 {
.lr.ph.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %11
  %indvars.iv = phi i64 [ %indvars.iv.next, %11 ], [ 0, %.lr.ph.preheader ]
  %6 = trunc i64 %indvars.iv to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %.lr.ph
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #6
  br label %11

; <label>:11:                                     ; preds = %.lr.ph, %9
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %11
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

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
