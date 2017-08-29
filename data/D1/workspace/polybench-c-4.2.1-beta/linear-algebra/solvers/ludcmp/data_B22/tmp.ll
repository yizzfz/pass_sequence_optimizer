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
  %16 = bitcast i8* %5 to double*
  tail call fastcc void @print_array(i32 2000, double* %16)
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
define internal fastcc void @init_array(i32, [2000 x double]* nocapture, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  br label %._crit_edge135

._crit_edge135:                                   ; preds = %._crit_edge135, %5
  %indvars.iv114134 = phi i64 [ 0, %5 ], [ %indvars.iv.next115.1, %._crit_edge135 ]
  %6 = getelementptr inbounds double, double* %3, i64 %indvars.iv114134
  store double 0.000000e+00, double* %6, align 8
  %7 = getelementptr inbounds double, double* %4, i64 %indvars.iv114134
  store double 0.000000e+00, double* %7, align 8
  %indvars.iv.next115 = or i64 %indvars.iv114134, 1
  %8 = trunc i64 %indvars.iv.next115 to i32
  %9 = sitofp i32 %8 to double
  %10 = fdiv double %9, 2.000000e+03
  %11 = fmul double %10, 5.000000e-01
  %12 = fadd double %11, 4.000000e+00
  %13 = getelementptr inbounds double, double* %2, i64 %indvars.iv114134
  store double %12, double* %13, align 8
  %14 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next115
  store double 0.000000e+00, double* %14, align 8
  %15 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next115
  store double 0.000000e+00, double* %15, align 8
  %indvars.iv.next115.1 = add nsw i64 %indvars.iv114134, 2
  %16 = trunc i64 %indvars.iv.next115.1 to i32
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, 2.000000e+03
  %19 = fmul double %18, 5.000000e-01
  %20 = fadd double %19, 4.000000e+00
  %21 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next115
  store double %20, double* %21, align 8
  %exitcond143.1 = icmp eq i64 %indvars.iv.next115, 1999
  br i1 %exitcond143.1, label %.preheader120.preheader, label %._crit_edge135

.preheader120.preheader:                          ; preds = %._crit_edge135
  br label %.preheader120

.preheader120:                                    ; preds = %.preheader120.preheader, %._crit_edge
  %indvars.iv110133 = phi i64 [ %indvars.iv.next111, %._crit_edge ], [ 1, %.preheader120.preheader ]
  %indvars.iv112132 = phi i64 [ %indvars.iv.next113, %._crit_edge ], [ 0, %.preheader120.preheader ]
  %22 = mul i64 %indvars.iv112132, 2001
  %23 = add i64 %22, 1
  %scevgep141 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %23
  %24 = mul i64 %indvars.iv112132, -8
  br label %._crit_edge136

.preheader119:                                    ; preds = %._crit_edge136
  %exitcond109130 = icmp eq i64 %indvars.iv112132, 1999
  br i1 %exitcond109130, label %._crit_edge.thread, label %._crit_edge

._crit_edge.thread:                               ; preds = %.preheader119
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 1999, i64 1999
  store double 1.000000e+00, double* %25, align 8
  br label %.loopexit

._crit_edge136:                                   ; preds = %._crit_edge136, %.preheader120
  %indvars.iv98128 = phi i64 [ 0, %.preheader120 ], [ %indvars.iv.next99, %._crit_edge136 ]
  %26 = sub nsw i64 0, %indvars.iv98128
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, 2000
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, 2.000000e+03
  %31 = fadd double %30, 1.000000e+00
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv112132, i64 %indvars.iv98128
  store double %31, double* %32, align 8
  %indvars.iv.next99 = add nuw nsw i64 %indvars.iv98128, 1
  %exitcond103 = icmp eq i64 %indvars.iv.next99, %indvars.iv110133
  br i1 %exitcond103, label %.preheader119, label %._crit_edge136

._crit_edge:                                      ; preds = %.preheader119
  %33 = add i64 %24, 15992
  %scevgep141142 = bitcast double* %scevgep141 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep141142, i8 0, i64 %33, i32 8, i1 false)
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv112132, i64 %indvars.iv112132
  store double 1.000000e+00, double* %34, align 8
  %indvars.iv.next113 = add nuw nsw i64 %indvars.iv112132, 1
  %35 = icmp slt i64 %indvars.iv.next113, 2000
  %indvars.iv.next111 = add nuw nsw i64 %indvars.iv110133, 1
  br i1 %35, label %.preheader120, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %._crit_edge
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %._crit_edge.thread
  %36 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %37

; <label>:37:                                     ; preds = %37, %.loopexit
  %indvars.iv96127 = phi i64 [ 0, %.loopexit ], [ %indvars.iv.next97.7, %37 ]
  %38 = mul nuw nsw i64 %indvars.iv96127, 16000
  %scevgep = getelementptr i8, i8* %36, i64 %38
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next97 = or i64 %indvars.iv96127, 1
  %39 = mul nuw nsw i64 %indvars.iv.next97, 16000
  %scevgep.1 = getelementptr i8, i8* %36, i64 %39
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next97.1 = or i64 %indvars.iv96127, 2
  %40 = mul nuw nsw i64 %indvars.iv.next97.1, 16000
  %scevgep.2 = getelementptr i8, i8* %36, i64 %40
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next97.2 = or i64 %indvars.iv96127, 3
  %41 = mul nuw nsw i64 %indvars.iv.next97.2, 16000
  %scevgep.3 = getelementptr i8, i8* %36, i64 %41
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next97.3 = or i64 %indvars.iv96127, 4
  %42 = mul nuw nsw i64 %indvars.iv.next97.3, 16000
  %scevgep.4 = getelementptr i8, i8* %36, i64 %42
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next97.4 = or i64 %indvars.iv96127, 5
  %43 = mul nuw nsw i64 %indvars.iv.next97.4, 16000
  %scevgep.5 = getelementptr i8, i8* %36, i64 %43
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next97.5 = or i64 %indvars.iv96127, 6
  %44 = mul nuw nsw i64 %indvars.iv.next97.5, 16000
  %scevgep.6 = getelementptr i8, i8* %36, i64 %44
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next97.6 = or i64 %indvars.iv96127, 7
  %45 = mul nuw nsw i64 %indvars.iv.next97.6, 16000
  %scevgep.7 = getelementptr i8, i8* %36, i64 %45
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %exitcond144.7 = icmp eq i64 %indvars.iv.next97.6, 1999
  %indvars.iv.next97.7 = add nsw i64 %indvars.iv96127, 8
  br i1 %exitcond144.7, label %.preheader79.preheader.preheader, label %37

.preheader79.preheader.preheader:                 ; preds = %37
  br label %.preheader79.preheader

.preheader79.preheader:                           ; preds = %.preheader79.preheader.preheader, %96
  %indvars.iv90125 = phi i64 [ %46, %96 ], [ 0, %.preheader79.preheader.preheader ]
  %scevgep151 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv90125
  %46 = add i64 %indvars.iv90125, 1
  %scevgep153 = getelementptr [2000 x double], [2000 x double]* %1, i64 1999, i64 %46
  br label %.preheader117

.preheader117:                                    ; preds = %.preheader79, %.preheader79.preheader
  %indvars.iv86124 = phi i64 [ 0, %.preheader79.preheader ], [ %indvars.iv.next87, %.preheader79 ]
  %47 = bitcast double* %scevgep153 to i8*
  %48 = bitcast double* %scevgep151 to i8*
  %49 = mul i64 %indvars.iv86124, 16000
  %scevgep149 = getelementptr i8, i8* %36, i64 %49
  %50 = add i64 %49, 16000
  %scevgep150 = getelementptr i8, i8* %36, i64 %50
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv86124, i64 %indvars.iv90125
  %bound0 = icmp ult i8* %scevgep149, %47
  %bound1 = icmp ult i8* %48, %scevgep150
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %51 to i8*
  %bound0156 = icmp ult i8* %scevgep149, %bc
  %bound1157 = icmp ult i8* %bc, %scevgep150
  %found.conflict158 = and i1 %bound0156, %bound1157
  %conflict.rdx = or i1 %found.conflict, %found.conflict158
  br i1 %conflict.rdx, label %._crit_edge138.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader117
  br label %vector.body

._crit_edge138.preheader:                         ; preds = %.preheader117
  br label %._crit_edge138

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %52 = bitcast i8* %36 to [2000 x [2000 x double]]*
  %53 = or i64 %index, 1
  %54 = or i64 %index, 2
  %55 = or i64 %index, 3
  %56 = load double, double* %51, align 8, !alias.scope !1
  %57 = insertelement <2 x double> undef, double %56, i32 0
  %58 = shufflevector <2 x double> %57, <2 x double> undef, <2 x i32> zeroinitializer
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %index, i64 %indvars.iv90125
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %53, i64 %indvars.iv90125
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %54, i64 %indvars.iv90125
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %55, i64 %indvars.iv90125
  %63 = load double, double* %59, align 8, !alias.scope !4
  %64 = load double, double* %60, align 8, !alias.scope !4
  %65 = load double, double* %61, align 8, !alias.scope !4
  %66 = load double, double* %62, align 8, !alias.scope !4
  %67 = insertelement <2 x double> undef, double %63, i32 0
  %68 = insertelement <2 x double> %67, double %64, i32 1
  %69 = insertelement <2 x double> undef, double %65, i32 0
  %70 = insertelement <2 x double> %69, double %66, i32 1
  %71 = fmul <2 x double> %58, %68
  %72 = fmul <2 x double> %58, %70
  %73 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %52, i64 0, i64 %indvars.iv86124, i64 %index
  %74 = bitcast double* %73 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %74, align 8, !alias.scope !6, !noalias !8
  %75 = getelementptr double, double* %73, i64 2
  %76 = bitcast double* %75 to <2 x double>*
  %wide.load160 = load <2 x double>, <2 x double>* %76, align 8, !alias.scope !6, !noalias !8
  %77 = fadd <2 x double> %wide.load, %71
  %78 = fadd <2 x double> %wide.load160, %72
  store <2 x double> %77, <2 x double>* %74, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %78, <2 x double>* %76, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %79 = icmp eq i64 %index.next, 2000
  br i1 %79, label %.preheader79.loopexit192, label %vector.body, !llvm.loop !9

._crit_edge138:                                   ; preds = %._crit_edge138, %._crit_edge138.preheader
  %indvars.iv82123 = phi i64 [ 0, %._crit_edge138.preheader ], [ %indvars.iv.next83.1, %._crit_edge138 ]
  %80 = bitcast i8* %36 to [2000 x [2000 x double]]*
  %81 = bitcast i8* %36 to [2000 x [2000 x double]]*
  %82 = load double, double* %51, align 8
  %83 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv82123, i64 %indvars.iv90125
  %84 = load double, double* %83, align 8
  %85 = fmul double %82, %84
  %86 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %81, i64 0, i64 %indvars.iv86124, i64 %indvars.iv82123
  %87 = load double, double* %86, align 8
  %88 = fadd double %87, %85
  store double %88, double* %86, align 8
  %indvars.iv.next83 = or i64 %indvars.iv82123, 1
  %89 = load double, double* %51, align 8
  %90 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next83, i64 %indvars.iv90125
  %91 = load double, double* %90, align 8
  %92 = fmul double %89, %91
  %93 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %80, i64 0, i64 %indvars.iv86124, i64 %indvars.iv.next83
  %94 = load double, double* %93, align 8
  %95 = fadd double %94, %92
  store double %95, double* %93, align 8
  %indvars.iv.next83.1 = add nsw i64 %indvars.iv82123, 2
  %exitcond85.1 = icmp eq i64 %indvars.iv.next83.1, 2000
  br i1 %exitcond85.1, label %.preheader79.loopexit, label %._crit_edge138, !llvm.loop !12

.preheader79.loopexit:                            ; preds = %._crit_edge138
  br label %.preheader79

.preheader79.loopexit192:                         ; preds = %vector.body
  br label %.preheader79

.preheader79:                                     ; preds = %.preheader79.loopexit192, %.preheader79.loopexit
  %indvars.iv.next87 = add nuw nsw i64 %indvars.iv86124, 1
  %exitcond89 = icmp eq i64 %indvars.iv.next87, 2000
  br i1 %exitcond89, label %96, label %.preheader117

; <label>:96:                                     ; preds = %.preheader79
  %97 = icmp slt i64 %46, 2000
  br i1 %97, label %.preheader79.preheader, label %.preheader116.preheader

.preheader116.preheader:                          ; preds = %96
  br label %.preheader116

.preheader116:                                    ; preds = %.preheader116.preheader, %middle.block162
  %indvars.iv80122 = phi i64 [ %98, %middle.block162 ], [ 0, %.preheader116.preheader ]
  %scevgep166 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv80122, i64 0
  %scevgep166167 = bitcast double* %scevgep166 to i8*
  %98 = add i64 %indvars.iv80122, 1
  %scevgep168 = getelementptr [2000 x double], [2000 x double]* %1, i64 %98, i64 0
  %scevgep168169 = bitcast double* %scevgep168 to i8*
  %99 = mul i64 %indvars.iv80122, 16000
  %scevgep170 = getelementptr i8, i8* %36, i64 %99
  %100 = add i64 %99, 16000
  %scevgep171 = getelementptr i8, i8* %36, i64 %100
  %bound0172 = icmp ult i8* %scevgep166167, %scevgep171
  %bound1173 = icmp ult i8* %scevgep170, %scevgep168169
  %memcheck.conflict175 = and i1 %bound0172, %bound1173
  br i1 %memcheck.conflict175, label %._crit_edge139.preheader, label %vector.body161.preheader

vector.body161.preheader:                         ; preds = %.preheader116
  br label %vector.body161

._crit_edge139.preheader:                         ; preds = %.preheader116
  br label %._crit_edge139

vector.body161:                                   ; preds = %vector.body161, %vector.body161.preheader
  %index178 = phi i64 [ 0, %vector.body161.preheader ], [ %index.next179.1, %vector.body161 ]
  %101 = bitcast i8* %36 to [2000 x [2000 x double]]*
  %102 = bitcast i8* %36 to [2000 x [2000 x double]]*
  %103 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %102, i64 0, i64 %indvars.iv80122, i64 %index178
  %104 = bitcast double* %103 to <2 x i64>*
  %wide.load186 = load <2 x i64>, <2 x i64>* %104, align 8, !alias.scope !13
  %105 = getelementptr double, double* %103, i64 2
  %106 = bitcast double* %105 to <2 x i64>*
  %wide.load187 = load <2 x i64>, <2 x i64>* %106, align 8, !alias.scope !13
  %107 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80122, i64 %index178
  %108 = bitcast double* %107 to <2 x i64>*
  store <2 x i64> %wide.load186, <2 x i64>* %108, align 8, !alias.scope !16, !noalias !13
  %109 = getelementptr double, double* %107, i64 2
  %110 = bitcast double* %109 to <2 x i64>*
  store <2 x i64> %wide.load187, <2 x i64>* %110, align 8, !alias.scope !16, !noalias !13
  %index.next179 = or i64 %index178, 4
  %111 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %101, i64 0, i64 %indvars.iv80122, i64 %index.next179
  %112 = bitcast double* %111 to <2 x i64>*
  %wide.load186.1 = load <2 x i64>, <2 x i64>* %112, align 8, !alias.scope !13
  %113 = getelementptr double, double* %111, i64 2
  %114 = bitcast double* %113 to <2 x i64>*
  %wide.load187.1 = load <2 x i64>, <2 x i64>* %114, align 8, !alias.scope !13
  %115 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80122, i64 %index.next179
  %116 = bitcast double* %115 to <2 x i64>*
  store <2 x i64> %wide.load186.1, <2 x i64>* %116, align 8, !alias.scope !16, !noalias !13
  %117 = getelementptr double, double* %115, i64 2
  %118 = bitcast double* %117 to <2 x i64>*
  store <2 x i64> %wide.load187.1, <2 x i64>* %118, align 8, !alias.scope !16, !noalias !13
  %index.next179.1 = add nsw i64 %index178, 8
  %119 = icmp eq i64 %index.next179.1, 2000
  br i1 %119, label %middle.block162.loopexit191, label %vector.body161, !llvm.loop !18

._crit_edge139:                                   ; preds = %._crit_edge139, %._crit_edge139.preheader
  %indvars.iv121 = phi i64 [ 0, %._crit_edge139.preheader ], [ %indvars.iv.next.4, %._crit_edge139 ]
  %120 = bitcast i8* %36 to [2000 x [2000 x double]]*
  %121 = bitcast i8* %36 to [2000 x [2000 x double]]*
  %122 = bitcast i8* %36 to [2000 x [2000 x double]]*
  %123 = bitcast i8* %36 to [2000 x [2000 x double]]*
  %124 = bitcast i8* %36 to [2000 x [2000 x double]]*
  %125 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %124, i64 0, i64 %indvars.iv80122, i64 %indvars.iv121
  %126 = bitcast double* %125 to i64*
  %127 = load i64, i64* %126, align 8
  %128 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80122, i64 %indvars.iv121
  %129 = bitcast double* %128 to i64*
  store i64 %127, i64* %129, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv121, 1
  %130 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %123, i64 0, i64 %indvars.iv80122, i64 %indvars.iv.next
  %131 = bitcast double* %130 to i64*
  %132 = load i64, i64* %131, align 8
  %133 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80122, i64 %indvars.iv.next
  %134 = bitcast double* %133 to i64*
  store i64 %132, i64* %134, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv121, 2
  %135 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %122, i64 0, i64 %indvars.iv80122, i64 %indvars.iv.next.1
  %136 = bitcast double* %135 to i64*
  %137 = load i64, i64* %136, align 8
  %138 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80122, i64 %indvars.iv.next.1
  %139 = bitcast double* %138 to i64*
  store i64 %137, i64* %139, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv121, 3
  %140 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %121, i64 0, i64 %indvars.iv80122, i64 %indvars.iv.next.2
  %141 = bitcast double* %140 to i64*
  %142 = load i64, i64* %141, align 8
  %143 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80122, i64 %indvars.iv.next.2
  %144 = bitcast double* %143 to i64*
  store i64 %142, i64* %144, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv121, 4
  %145 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %120, i64 0, i64 %indvars.iv80122, i64 %indvars.iv.next.3
  %146 = bitcast double* %145 to i64*
  %147 = load i64, i64* %146, align 8
  %148 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80122, i64 %indvars.iv.next.3
  %149 = bitcast double* %148 to i64*
  store i64 %147, i64* %149, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv121, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %middle.block162.loopexit, label %._crit_edge139, !llvm.loop !19

middle.block162.loopexit:                         ; preds = %._crit_edge139
  br label %middle.block162

middle.block162.loopexit191:                      ; preds = %vector.body161
  br label %middle.block162

middle.block162:                                  ; preds = %middle.block162.loopexit191, %middle.block162.loopexit
  %150 = icmp slt i64 %98, 2000
  br i1 %150, label %.preheader116, label %151

; <label>:151:                                    ; preds = %middle.block162
  tail call void @free(i8* nonnull %36) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32, [2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  br label %.preheader125

.preheader125:                                    ; preds = %._crit_edge159, %5
  %indvars.iv123160 = phi i64 [ 0, %5 ], [ %indvars.iv.next124, %._crit_edge159 ]
  %exitcond111146 = icmp eq i64 %indvars.iv123160, 0
  br i1 %exitcond111146, label %.lr.ph158.split.preheader, label %.lr.ph148.preheader

.lr.ph148.preheader:                              ; preds = %.preheader125
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv123160, i64 0
  br label %.lr.ph148

.lr.ph158.split.preheader:                        ; preds = %.preheader125
  br label %.lr.ph158.split

.lr.ph158.split.us:                               ; preds = %.lr.ph158.split.us.preheader, %._crit_edge154.us
  %indvars.iv119157.us = phi i64 [ %indvars.iv.next120.us, %._crit_edge154.us ], [ %indvars.iv123160, %.lr.ph158.split.us.preheader ]
  %7 = icmp eq i64 %xtraiter197, 0
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv123160, i64 %indvars.iv119157.us
  %9 = load double, double* %8, align 8
  br i1 %7, label %._crit_edge162.prol.loopexit, label %._crit_edge162.prol

._crit_edge162.prol:                              ; preds = %.lr.ph158.split.us
  %10 = load double, double* %51, align 8
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv119157.us
  %12 = load double, double* %11, align 8
  %13 = fmul double %10, %12
  %14 = fsub double %9, %13
  br label %._crit_edge162.prol.loopexit

._crit_edge162.prol.loopexit:                     ; preds = %._crit_edge162.prol, %.lr.ph158.split.us
  %.lcssa191.unr.ph = phi double [ %14, %._crit_edge162.prol ], [ undef, %.lr.ph158.split.us ]
  %.1151.us.unr.ph = phi double [ %14, %._crit_edge162.prol ], [ %9, %.lr.ph158.split.us ]
  %indvars.iv112150.us.unr.ph = phi i64 [ 1, %._crit_edge162.prol ], [ 0, %.lr.ph158.split.us ]
  %15 = icmp eq i64 %indvars.iv123160, 1
  br i1 %15, label %._crit_edge154.us, label %.lr.ph158.split.us.new

.lr.ph158.split.us.new:                           ; preds = %._crit_edge162.prol.loopexit
  br label %._crit_edge162

._crit_edge162:                                   ; preds = %._crit_edge162, %.lr.ph158.split.us.new
  %.1151.us = phi double [ %.1151.us.unr.ph, %.lr.ph158.split.us.new ], [ %27, %._crit_edge162 ]
  %indvars.iv112150.us = phi i64 [ %indvars.iv112150.us.unr.ph, %.lr.ph158.split.us.new ], [ %indvars.iv.next113.us.1, %._crit_edge162 ]
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv123160, i64 %indvars.iv112150.us
  %17 = load double, double* %16, align 8
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv112150.us, i64 %indvars.iv119157.us
  %19 = load double, double* %18, align 8
  %20 = fmul double %17, %19
  %21 = fsub double %.1151.us, %20
  %indvars.iv.next113.us = add nuw nsw i64 %indvars.iv112150.us, 1
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv123160, i64 %indvars.iv.next113.us
  %23 = load double, double* %22, align 8
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next113.us, i64 %indvars.iv119157.us
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = fsub double %21, %26
  %indvars.iv.next113.us.1 = add nsw i64 %indvars.iv112150.us, 2
  %exitcond116.us.1 = icmp eq i64 %indvars.iv.next113.us.1, %indvars.iv123160
  br i1 %exitcond116.us.1, label %._crit_edge154.us.loopexit, label %._crit_edge162

._crit_edge154.us.loopexit:                       ; preds = %._crit_edge162
  br label %._crit_edge154.us

._crit_edge154.us:                                ; preds = %._crit_edge154.us.loopexit, %._crit_edge162.prol.loopexit
  %.lcssa191 = phi double [ %.lcssa191.unr.ph, %._crit_edge162.prol.loopexit ], [ %27, %._crit_edge154.us.loopexit ]
  store double %.lcssa191, double* %8, align 8
  %indvars.iv.next120.us = add nuw nsw i64 %indvars.iv119157.us, 1
  %exitcond122.us = icmp eq i64 %indvars.iv.next120.us, 2000
  br i1 %exitcond122.us, label %._crit_edge159.loopexit205, label %.lr.ph158.split.us

.lr.ph148:                                        ; preds = %.lr.ph148.preheader, %._crit_edge144
  %indvars.iv106147 = phi i64 [ %indvars.iv.next107, %._crit_edge144 ], [ 0, %.lr.ph148.preheader ]
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv123160, i64 %indvars.iv106147
  %29 = load double, double* %28, align 8
  %exitcond105139 = icmp eq i64 %indvars.iv106147, 0
  br i1 %exitcond105139, label %._crit_edge144, label %.lr.ph143.preheader

.lr.ph143.preheader:                              ; preds = %.lr.ph148
  %xtraiter195 = and i64 %indvars.iv106147, 1
  %lcmp.mod196 = icmp eq i64 %xtraiter195, 0
  br i1 %lcmp.mod196, label %.lr.ph143.prol.loopexit, label %.lr.ph143.prol

.lr.ph143.prol:                                   ; preds = %.lr.ph143.preheader
  %30 = load double, double* %6, align 8
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv106147
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = fsub double %29, %33
  br label %.lr.ph143.prol.loopexit

.lr.ph143.prol.loopexit:                          ; preds = %.lr.ph143.prol, %.lr.ph143.preheader
  %.lcssa190.unr.ph = phi double [ %34, %.lr.ph143.prol ], [ undef, %.lr.ph143.preheader ]
  %.0141.unr.ph = phi double [ %34, %.lr.ph143.prol ], [ %29, %.lr.ph143.preheader ]
  %indvars.iv101140.unr.ph = phi i64 [ 1, %.lr.ph143.prol ], [ 0, %.lr.ph143.preheader ]
  %35 = icmp eq i64 %indvars.iv106147, 1
  br i1 %35, label %._crit_edge144, label %.lr.ph143.preheader.new

.lr.ph143.preheader.new:                          ; preds = %.lr.ph143.prol.loopexit
  br label %.lr.ph143

.lr.ph143:                                        ; preds = %.lr.ph143, %.lr.ph143.preheader.new
  %.0141 = phi double [ %.0141.unr.ph, %.lr.ph143.preheader.new ], [ %47, %.lr.ph143 ]
  %indvars.iv101140 = phi i64 [ %indvars.iv101140.unr.ph, %.lr.ph143.preheader.new ], [ %indvars.iv.next102.1, %.lr.ph143 ]
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv123160, i64 %indvars.iv101140
  %37 = load double, double* %36, align 8
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv101140, i64 %indvars.iv106147
  %39 = load double, double* %38, align 8
  %40 = fmul double %37, %39
  %41 = fsub double %.0141, %40
  %indvars.iv.next102 = add nuw nsw i64 %indvars.iv101140, 1
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv123160, i64 %indvars.iv.next102
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next102, i64 %indvars.iv106147
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %47 = fsub double %41, %46
  %indvars.iv.next102.1 = add nsw i64 %indvars.iv101140, 2
  %exitcond105.1 = icmp eq i64 %indvars.iv.next102.1, %indvars.iv106147
  br i1 %exitcond105.1, label %._crit_edge144.loopexit, label %.lr.ph143

._crit_edge144.loopexit:                          ; preds = %.lr.ph143
  br label %._crit_edge144

._crit_edge144:                                   ; preds = %._crit_edge144.loopexit, %.lr.ph143.prol.loopexit, %.lr.ph148
  %.0.lcssa = phi double [ %29, %.lr.ph148 ], [ %.lcssa190.unr.ph, %.lr.ph143.prol.loopexit ], [ %47, %._crit_edge144.loopexit ]
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106147, i64 %indvars.iv106147
  %49 = load double, double* %48, align 8
  %50 = fdiv double %.0.lcssa, %49
  store double %50, double* %28, align 8
  %indvars.iv.next107 = add nuw nsw i64 %indvars.iv106147, 1
  %exitcond111 = icmp eq i64 %indvars.iv.next107, %indvars.iv123160
  br i1 %exitcond111, label %.lr.ph158.split.us.preheader, label %.lr.ph148

.lr.ph158.split.us.preheader:                     ; preds = %._crit_edge144
  %xtraiter197 = and i64 %indvars.iv123160, 1
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv123160, i64 0
  br label %.lr.ph158.split.us

.lr.ph158.split:                                  ; preds = %.lr.ph158.split, %.lr.ph158.split.preheader
  %indvars.iv119157 = phi i64 [ 0, %.lr.ph158.split.preheader ], [ %indvars.iv.next120.24, %.lr.ph158.split ]
  %indvars.iv.next120.24 = add nsw i64 %indvars.iv119157, 25
  %exitcond122.24 = icmp eq i64 %indvars.iv.next120.24, 2000
  br i1 %exitcond122.24, label %._crit_edge159.loopexit, label %.lr.ph158.split

._crit_edge159.loopexit:                          ; preds = %.lr.ph158.split
  br label %._crit_edge159

._crit_edge159.loopexit205:                       ; preds = %._crit_edge154.us
  br label %._crit_edge159

._crit_edge159:                                   ; preds = %._crit_edge159.loopexit205, %._crit_edge159.loopexit
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123160, 1
  %52 = icmp slt i64 %indvars.iv.next124, 2000
  br i1 %52, label %.preheader125, label %._crit_edge136._crit_edge.preheader

._crit_edge136._crit_edge.preheader:              ; preds = %._crit_edge159
  br label %._crit_edge136._crit_edge

._crit_edge136._crit_edge:                        ; preds = %._crit_edge136._crit_edge.backedge, %._crit_edge136._crit_edge.preheader
  %indvars.iv99138 = phi i64 [ 0, %._crit_edge136._crit_edge.preheader ], [ %indvars.iv99138.be, %._crit_edge136._crit_edge.backedge ]
  %53 = getelementptr inbounds double, double* %2, i64 %indvars.iv99138
  %54 = load double, double* %53, align 8
  %exitcond131 = icmp eq i64 %indvars.iv99138, 0
  br i1 %exitcond131, label %._crit_edge136.thread, label %.lr.ph135.preheader

.lr.ph135.preheader:                              ; preds = %._crit_edge136._crit_edge
  %55 = add i64 %indvars.iv99138, -1
  %xtraiter192 = and i64 %indvars.iv99138, 3
  %lcmp.mod193 = icmp eq i64 %xtraiter192, 0
  br i1 %lcmp.mod193, label %.lr.ph135.prol.loopexit, label %.lr.ph135.prol.preheader

.lr.ph135.prol.preheader:                         ; preds = %.lr.ph135.preheader
  br label %.lr.ph135.prol

.lr.ph135.prol:                                   ; preds = %.lr.ph135.prol, %.lr.ph135.prol.preheader
  %.2133.prol = phi double [ %61, %.lr.ph135.prol ], [ %54, %.lr.ph135.prol.preheader ]
  %indvars.iv132.prol = phi i64 [ %indvars.iv.next.prol, %.lr.ph135.prol ], [ 0, %.lr.ph135.prol.preheader ]
  %prol.iter194 = phi i64 [ %prol.iter194.sub, %.lr.ph135.prol ], [ %xtraiter192, %.lr.ph135.prol.preheader ]
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv99138, i64 %indvars.iv132.prol
  %57 = load double, double* %56, align 8
  %58 = getelementptr inbounds double, double* %4, i64 %indvars.iv132.prol
  %59 = load double, double* %58, align 8
  %60 = fmul double %57, %59
  %61 = fsub double %.2133.prol, %60
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv132.prol, 1
  %prol.iter194.sub = add i64 %prol.iter194, -1
  %prol.iter194.cmp = icmp eq i64 %prol.iter194.sub, 0
  br i1 %prol.iter194.cmp, label %.lr.ph135.prol.loopexit.loopexit, label %.lr.ph135.prol, !llvm.loop !20

.lr.ph135.prol.loopexit.loopexit:                 ; preds = %.lr.ph135.prol
  br label %.lr.ph135.prol.loopexit

.lr.ph135.prol.loopexit:                          ; preds = %.lr.ph135.prol.loopexit.loopexit, %.lr.ph135.preheader
  %.lcssa189.unr = phi double [ undef, %.lr.ph135.preheader ], [ %61, %.lr.ph135.prol.loopexit.loopexit ]
  %.2133.unr = phi double [ %54, %.lr.ph135.preheader ], [ %61, %.lr.ph135.prol.loopexit.loopexit ]
  %indvars.iv132.unr = phi i64 [ 0, %.lr.ph135.preheader ], [ %indvars.iv.next.prol, %.lr.ph135.prol.loopexit.loopexit ]
  %62 = icmp ult i64 %55, 3
  br i1 %62, label %._crit_edge136, label %.lr.ph135.preheader.new

.lr.ph135.preheader.new:                          ; preds = %.lr.ph135.prol.loopexit
  br label %.lr.ph135

._crit_edge136.thread:                            ; preds = %._crit_edge136._crit_edge
  store double %54, double* %4, align 8
  br label %._crit_edge136._crit_edge.backedge

._crit_edge136._crit_edge.backedge:               ; preds = %._crit_edge136.thread, %._crit_edge136
  %indvars.iv99138.be = phi i64 [ 1, %._crit_edge136.thread ], [ %indvars.iv.next100, %._crit_edge136 ]
  br label %._crit_edge136._crit_edge

.lr.ph135:                                        ; preds = %.lr.ph135, %.lr.ph135.preheader.new
  %.2133 = phi double [ %.2133.unr, %.lr.ph135.preheader.new ], [ %86, %.lr.ph135 ]
  %indvars.iv132 = phi i64 [ %indvars.iv132.unr, %.lr.ph135.preheader.new ], [ %indvars.iv.next.3, %.lr.ph135 ]
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv99138, i64 %indvars.iv132
  %64 = load double, double* %63, align 8
  %65 = getelementptr inbounds double, double* %4, i64 %indvars.iv132
  %66 = load double, double* %65, align 8
  %67 = fmul double %64, %66
  %68 = fsub double %.2133, %67
  %indvars.iv.next = add nuw nsw i64 %indvars.iv132, 1
  %69 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv99138, i64 %indvars.iv.next
  %70 = load double, double* %69, align 8
  %71 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next
  %72 = load double, double* %71, align 8
  %73 = fmul double %70, %72
  %74 = fsub double %68, %73
  %indvars.iv.next.1 = add nsw i64 %indvars.iv132, 2
  %75 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv99138, i64 %indvars.iv.next.1
  %76 = load double, double* %75, align 8
  %77 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next.1
  %78 = load double, double* %77, align 8
  %79 = fmul double %76, %78
  %80 = fsub double %74, %79
  %indvars.iv.next.2 = add nsw i64 %indvars.iv132, 3
  %81 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv99138, i64 %indvars.iv.next.2
  %82 = load double, double* %81, align 8
  %83 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next.2
  %84 = load double, double* %83, align 8
  %85 = fmul double %82, %84
  %86 = fsub double %80, %85
  %indvars.iv.next.3 = add nsw i64 %indvars.iv132, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv99138
  br i1 %exitcond.3, label %._crit_edge136.loopexit, label %.lr.ph135

._crit_edge136.loopexit:                          ; preds = %.lr.ph135
  br label %._crit_edge136

._crit_edge136:                                   ; preds = %._crit_edge136.loopexit, %.lr.ph135.prol.loopexit
  %.lcssa189 = phi double [ %.lcssa189.unr, %.lr.ph135.prol.loopexit ], [ %86, %._crit_edge136.loopexit ]
  %87 = getelementptr inbounds double, double* %4, i64 %indvars.iv99138
  store double %.lcssa189, double* %87, align 8
  %indvars.iv.next100 = add nuw nsw i64 %indvars.iv99138, 1
  %88 = icmp slt i64 %indvars.iv.next100, 2000
  br i1 %88, label %._crit_edge136._crit_edge.backedge, label %.preheader.preheader

.preheader.preheader:                             ; preds = %._crit_edge136
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvar = phi i64 [ 0, %.preheader.preheader ], [ %indvar.next, %._crit_edge ]
  %indvars.iv.next96129 = phi i64 [ 1999, %.preheader.preheader ], [ %indvars.iv.next96, %._crit_edge ]
  %indvars.iv95128 = phi i64 [ 2000, %.preheader.preheader ], [ %indvars.iv.next96129, %._crit_edge ]
  %89 = add i64 %indvar, -1
  %90 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next96129
  %91 = load double, double* %90, align 8
  %92 = icmp slt i64 %indvars.iv95128, 2000
  br i1 %92, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  %xtraiter = and i64 %indvar, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol, %.lr.ph.prol.preheader
  %.3127.prol = phi double [ %98, %.lr.ph.prol ], [ %91, %.lr.ph.prol.preheader ]
  %indvars.iv93126.prol = phi i64 [ %indvars.iv.next94.prol, %.lr.ph.prol ], [ %indvars.iv95128, %.lr.ph.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %93 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next96129, i64 %indvars.iv93126.prol
  %94 = load double, double* %93, align 8
  %95 = getelementptr inbounds double, double* %3, i64 %indvars.iv93126.prol
  %96 = load double, double* %95, align 8
  %97 = fmul double %94, %96
  %98 = fsub double %.3127.prol, %97
  %indvars.iv.next94.prol = add nsw i64 %indvars.iv93126.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !22

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %.lcssa.unr = phi double [ undef, %.lr.ph.preheader ], [ %98, %.lr.ph.prol.loopexit.loopexit ]
  %.3127.unr = phi double [ %91, %.lr.ph.preheader ], [ %98, %.lr.ph.prol.loopexit.loopexit ]
  %indvars.iv93126.unr = phi i64 [ %indvars.iv95128, %.lr.ph.preheader ], [ %indvars.iv.next94.prol, %.lr.ph.prol.loopexit.loopexit ]
  %99 = icmp ult i64 %89, 3
  br i1 %99, label %._crit_edge, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %.3127 = phi double [ %.3127.unr, %.lr.ph.preheader.new ], [ %123, %.lr.ph ]
  %indvars.iv93126 = phi i64 [ %indvars.iv93126.unr, %.lr.ph.preheader.new ], [ %indvars.iv.next94.3, %.lr.ph ]
  %100 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next96129, i64 %indvars.iv93126
  %101 = load double, double* %100, align 8
  %102 = getelementptr inbounds double, double* %3, i64 %indvars.iv93126
  %103 = load double, double* %102, align 8
  %104 = fmul double %101, %103
  %105 = fsub double %.3127, %104
  %indvars.iv.next94 = add nsw i64 %indvars.iv93126, 1
  %106 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next96129, i64 %indvars.iv.next94
  %107 = load double, double* %106, align 8
  %108 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next94
  %109 = load double, double* %108, align 8
  %110 = fmul double %107, %109
  %111 = fsub double %105, %110
  %indvars.iv.next94.1 = add nsw i64 %indvars.iv93126, 2
  %112 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next96129, i64 %indvars.iv.next94.1
  %113 = load double, double* %112, align 8
  %114 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next94.1
  %115 = load double, double* %114, align 8
  %116 = fmul double %113, %115
  %117 = fsub double %111, %116
  %indvars.iv.next94.2 = add nsw i64 %indvars.iv93126, 3
  %118 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next96129, i64 %indvars.iv.next94.2
  %119 = load double, double* %118, align 8
  %120 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next94.2
  %121 = load double, double* %120, align 8
  %122 = fmul double %119, %121
  %123 = fsub double %117, %122
  %exitcond166.3 = icmp eq i64 %indvars.iv.next94.2, 1999
  %indvars.iv.next94.3 = add nsw i64 %indvars.iv93126, 4
  br i1 %exitcond166.3, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %.preheader
  %.3.lcssa = phi double [ %91, %.preheader ], [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %123, %._crit_edge.loopexit ]
  %124 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next96129, i64 %indvars.iv.next96129
  %125 = load double, double* %124, align 8
  %126 = fdiv double %.3.lcssa, %125
  %127 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next96129
  store double %126, double* %127, align 8
  %128 = icmp sgt i64 %indvars.iv.next96129, 0
  %indvars.iv.next96 = add nsw i64 %indvars.iv.next96129, -1
  %indvar.next = add i64 %indvar, 1
  br i1 %128, label %.preheader, label %129

; <label>:129:                                    ; preds = %._crit_edge
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
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge, %2
  %indvars.iv5 = phi i64 [ 0, %2 ], [ %indvars.iv.next, %._crit_edge ]
  %7 = trunc i64 %indvars.iv5 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %._crit_edge6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge6, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds double, double* %1, i64 %indvars.iv5
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv5, 1
  %16 = icmp slt i64 %indvars.iv.next, 2000
  br i1 %16, label %._crit_edge6, label %17

; <label>:17:                                     ; preds = %._crit_edge
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #6
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
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = !{!7}
!7 = distinct !{!7, !3}
!8 = !{!5, !2}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.vectorize.width", i32 1}
!11 = !{!"llvm.loop.interleave.count", i32 1}
!12 = distinct !{!12, !10, !11}
!13 = !{!14}
!14 = distinct !{!14, !15}
!15 = distinct !{!15, !"LVerDomain"}
!16 = !{!17}
!17 = distinct !{!17, !15}
!18 = distinct !{!18, !10, !11}
!19 = distinct !{!19, !10, !11}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !21}
