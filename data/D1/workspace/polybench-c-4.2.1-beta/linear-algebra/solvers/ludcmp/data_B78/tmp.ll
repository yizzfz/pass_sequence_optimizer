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
  %3 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %6 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %7 = bitcast i8* %3 to [2000 x double]*
  %8 = bitcast i8* %4 to double*
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  call fastcc void @init_array(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  call void (...) @polybench_timer_start() #4
  call fastcc void @kernel_ludcmp(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  call fastcc void @print_array(i32 2000, double* %9)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]*, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
.lr.ph68:
  %5 = alloca [2000 x double]*, align 8
  %6 = alloca [2000 x [2000 x double]]*, align 8
  store [2000 x double]* %1, [2000 x double]** %5, align 8
  br label %._crit_edge80

._crit_edge80:                                    ; preds = %._crit_edge80, %.lr.ph68
  %indvars.iv127 = phi i64 [ 0, %.lr.ph68 ], [ %indvars.iv.next128.1, %._crit_edge80 ]
  %7 = getelementptr inbounds double, double* %3, i64 %indvars.iv127
  %8 = bitcast double* %7 to <2 x double>*
  %9 = getelementptr inbounds double, double* %4, i64 %indvars.iv127
  %10 = bitcast double* %9 to <2 x double>*
  %indvars.iv.next128 = or i64 %indvars.iv127, 1
  %11 = trunc i64 %indvars.iv.next128 to i32
  %12 = sitofp i32 %11 to double
  %13 = getelementptr inbounds double, double* %2, i64 %indvars.iv127
  store <2 x double> zeroinitializer, <2 x double>* %8, align 8
  store <2 x double> zeroinitializer, <2 x double>* %10, align 8
  %indvars.iv.next128.1 = add nsw i64 %indvars.iv127, 2
  %14 = trunc i64 %indvars.iv.next128.1 to i32
  %15 = sitofp i32 %14 to double
  %16 = insertelement <2 x double> undef, double %12, i32 0
  %17 = insertelement <2 x double> %16, double %15, i32 1
  %18 = fdiv <2 x double> %17, <double 2.000000e+03, double 2.000000e+03>
  %19 = fmul <2 x double> %18, <double 5.000000e-01, double 5.000000e-01>
  %20 = fadd <2 x double> %19, <double 4.000000e+00, double 4.000000e+00>
  %21 = bitcast double* %13 to <2 x double>*
  store <2 x double> %20, <2 x double>* %21, align 8
  %exitcond130.1 = icmp eq i64 %indvars.iv.next128, 1999
  br i1 %exitcond130.1, label %.lr.ph50.preheader, label %._crit_edge80

.lr.ph50.preheader:                               ; preds = %._crit_edge80
  br label %.lr.ph50

.lr.ph50:                                         ; preds = %.lr.ph50.preheader, %._crit_edge57._crit_edge
  %indvars.iv125 = phi i64 [ %indvars.iv.next126, %._crit_edge57._crit_edge ], [ 0, %.lr.ph50.preheader ]
  %22 = shl i64 %indvars.iv125, 32
  %sext = add i64 %22, 4294967296
  %23 = ashr exact i64 %sext, 32
  %scevgep123 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv125, i64 %23
  %24 = sub i64 1998, %indvars.iv125
  %25 = shl i64 %24, 3
  %26 = and i64 %25, 34359738360
  %27 = add nuw nsw i64 %26, 8
  br label %28

; <label>:28:                                     ; preds = %28, %.lr.ph50
  %indvars.iv110 = phi i64 [ %indvars.iv.next111, %28 ], [ 0, %.lr.ph50 ]
  %29 = sub nsw i64 0, %indvars.iv110
  %30 = trunc i64 %29 to i32
  %31 = srem i32 %30, 2000
  %32 = sitofp i32 %31 to double
  %33 = fdiv double %32, 2.000000e+03
  %34 = fadd double %33, 1.000000e+00
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv125, i64 %indvars.iv110
  store double %34, double* %35, align 8
  %exitcond117 = icmp eq i64 %indvars.iv110, %indvars.iv125
  %indvars.iv.next111 = add nuw nsw i64 %indvars.iv110, 1
  br i1 %exitcond117, label %._crit_edge51, label %28

._crit_edge51:                                    ; preds = %28
  %indvars.iv.next126 = add nuw nsw i64 %indvars.iv125, 1
  %36 = icmp slt i64 %indvars.iv.next126, 2000
  br i1 %36, label %._crit_edge57._crit_edge, label %.lr.ph43..lr.ph43.split.us_crit_edge

._crit_edge57._crit_edge:                         ; preds = %._crit_edge51
  %37 = bitcast double* %scevgep123 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %37, i8 0, i64 %27, i32 8, i1 false)
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv125, i64 %indvars.iv125
  store double 1.000000e+00, double* %38, align 8
  br label %.lr.ph50

.lr.ph43..lr.ph43.split.us_crit_edge:             ; preds = %._crit_edge51
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv125, i64 %indvars.iv125
  store double 1.000000e+00, double* %39, align 8
  %40 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %41 = bitcast [2000 x [2000 x double]]** %6 to i8**
  store i8* %40, i8** %41, align 8
  %42 = bitcast i8* %40 to [2000 x [2000 x double]]*
  br label %._crit_edge39.us

._crit_edge39.us:                                 ; preds = %._crit_edge39.us, %.lr.ph43..lr.ph43.split.us_crit_edge
  %indvars.iv108 = phi i64 [ 0, %.lr.ph43..lr.ph43.split.us_crit_edge ], [ %indvars.iv.next109.7, %._crit_edge39.us ]
  %43 = mul nuw nsw i64 %indvars.iv108, 16000
  %scevgep = getelementptr i8, i8* %40, i64 %43
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next109 = or i64 %indvars.iv108, 1
  %44 = mul nuw nsw i64 %indvars.iv.next109, 16000
  %scevgep.1 = getelementptr i8, i8* %40, i64 %44
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next109.1 = or i64 %indvars.iv108, 2
  %45 = mul nuw nsw i64 %indvars.iv.next109.1, 16000
  %scevgep.2 = getelementptr i8, i8* %40, i64 %45
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next109.2 = or i64 %indvars.iv108, 3
  %46 = mul nuw nsw i64 %indvars.iv.next109.2, 16000
  %scevgep.3 = getelementptr i8, i8* %40, i64 %46
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next109.3 = or i64 %indvars.iv108, 4
  %47 = mul nuw nsw i64 %indvars.iv.next109.3, 16000
  %scevgep.4 = getelementptr i8, i8* %40, i64 %47
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next109.4 = or i64 %indvars.iv108, 5
  %48 = mul nuw nsw i64 %indvars.iv.next109.4, 16000
  %scevgep.5 = getelementptr i8, i8* %40, i64 %48
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next109.5 = or i64 %indvars.iv108, 6
  %49 = mul nuw nsw i64 %indvars.iv.next109.5, 16000
  %scevgep.6 = getelementptr i8, i8* %40, i64 %49
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next109.6 = or i64 %indvars.iv108, 7
  %50 = mul nuw nsw i64 %indvars.iv.next109.6, 16000
  %scevgep.7 = getelementptr i8, i8* %40, i64 %50
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next109.7 = add nsw i64 %indvars.iv108, 8
  %51 = icmp slt i64 %indvars.iv.next109.7, 2000
  br i1 %51, label %._crit_edge39.us, label %.lr.ph30..lr.ph30.split.us_crit_edge

.lr.ph30..lr.ph30.split.us_crit_edge:             ; preds = %._crit_edge39.us
  br label %.lr.ph30.split.us..lr.ph19.us.us_crit_edge

.lr.ph30.split.us..lr.ph19.us.us_crit_edge:       ; preds = %._crit_edge24.us, %.lr.ph30..lr.ph30.split.us_crit_edge
  %indvars.iv104 = phi i64 [ 0, %.lr.ph30..lr.ph30.split.us_crit_edge ], [ %52, %._crit_edge24.us ]
  %scevgep137 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv104
  %52 = add i64 %indvars.iv104, 1
  %scevgep139 = getelementptr [2000 x double], [2000 x double]* %1, i64 1999, i64 %52
  br label %.lr.ph19.us.us

._crit_edge24.us:                                 ; preds = %._crit_edge20.us.us
  %53 = icmp slt i64 %52, 2000
  br i1 %53, label %.lr.ph30.split.us..lr.ph19.us.us_crit_edge, label %.lr.ph12..lr.ph12.split.us_crit_edge

.lr.ph19.us.us:                                   ; preds = %._crit_edge20.us.us, %.lr.ph30.split.us..lr.ph19.us.us_crit_edge
  %indvars.iv102 = phi i64 [ 0, %.lr.ph30.split.us..lr.ph19.us.us_crit_edge ], [ %54, %._crit_edge20.us.us ]
  %scevgep133 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %42, i64 0, i64 %indvars.iv102, i64 0
  %54 = add i64 %indvars.iv102, 1
  %scevgep135 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %42, i64 0, i64 %54, i64 0
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv102, i64 %indvars.iv104
  %bound0 = icmp ult double* %scevgep133, %scevgep139
  %bound1 = icmp ult double* %scevgep137, %scevgep135
  %found.conflict = and i1 %bound0, %bound1
  %bound0142 = icmp ult double* %scevgep133, %55
  %bound1143 = icmp ult double* %55, %scevgep135
  %found.conflict144 = and i1 %bound0142, %bound1143
  %conflict.rdx = or i1 %found.conflict, %found.conflict144
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.lr.ph19.us.us
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.lr.ph19.us.us
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %56 = or i64 %index, 1
  %57 = or i64 %index, 2
  %58 = or i64 %index, 3
  %59 = load double, double* %55, align 8, !alias.scope !1
  %60 = insertelement <2 x double> undef, double %59, i32 0
  %61 = shufflevector <2 x double> %60, <2 x double> undef, <2 x i32> zeroinitializer
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %index, i64 %indvars.iv104
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %56, i64 %indvars.iv104
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %57, i64 %indvars.iv104
  %65 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %58, i64 %indvars.iv104
  %66 = load double, double* %62, align 8, !alias.scope !4
  %67 = load double, double* %63, align 8, !alias.scope !4
  %68 = load double, double* %64, align 8, !alias.scope !4
  %69 = load double, double* %65, align 8, !alias.scope !4
  %70 = insertelement <2 x double> undef, double %66, i32 0
  %71 = insertelement <2 x double> %70, double %67, i32 1
  %72 = insertelement <2 x double> undef, double %68, i32 0
  %73 = insertelement <2 x double> %72, double %69, i32 1
  %74 = fmul <2 x double> %61, %71
  %75 = fmul <2 x double> %61, %73
  %76 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %42, i64 0, i64 %indvars.iv102, i64 %index
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !6, !noalias !8
  %78 = getelementptr double, double* %76, i64 2
  %79 = bitcast double* %78 to <2 x double>*
  %wide.load146 = load <2 x double>, <2 x double>* %79, align 8, !alias.scope !6, !noalias !8
  %80 = fadd <2 x double> %wide.load, %74
  %81 = fadd <2 x double> %wide.load146, %75
  store <2 x double> %80, <2 x double>* %77, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %81, <2 x double>* %79, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %82 = icmp eq i64 %index.next, 2000
  br i1 %82, label %._crit_edge20.us.us.loopexit177, label %vector.body, !llvm.loop !9

._crit_edge20.us.us.loopexit:                     ; preds = %scalar.ph
  br label %._crit_edge20.us.us

._crit_edge20.us.us.loopexit177:                  ; preds = %vector.body
  br label %._crit_edge20.us.us

._crit_edge20.us.us:                              ; preds = %._crit_edge20.us.us.loopexit177, %._crit_edge20.us.us.loopexit
  %83 = icmp slt i64 %54, 2000
  br i1 %83, label %.lr.ph19.us.us, label %._crit_edge24.us

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv98 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next99.1, %scalar.ph ]
  %84 = load double, double* %55, align 8
  %85 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv98, i64 %indvars.iv104
  %86 = load double, double* %85, align 8
  %87 = fmul double %84, %86
  %88 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %42, i64 0, i64 %indvars.iv102, i64 %indvars.iv98
  %89 = load double, double* %88, align 8
  %90 = fadd double %89, %87
  store double %90, double* %88, align 8
  %indvars.iv.next99 = or i64 %indvars.iv98, 1
  %91 = load double, double* %55, align 8
  %92 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next99, i64 %indvars.iv104
  %93 = load double, double* %92, align 8
  %94 = fmul double %91, %93
  %95 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %42, i64 0, i64 %indvars.iv102, i64 %indvars.iv.next99
  %96 = load double, double* %95, align 8
  %97 = fadd double %96, %94
  store double %97, double* %95, align 8
  %exitcond101.1 = icmp eq i64 %indvars.iv.next99, 1999
  %indvars.iv.next99.1 = add nsw i64 %indvars.iv98, 2
  br i1 %exitcond101.1, label %._crit_edge20.us.us.loopexit, label %scalar.ph, !llvm.loop !12

.lr.ph12..lr.ph12.split.us_crit_edge:             ; preds = %._crit_edge24.us
  %98 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %6, align 8
  %99 = load [2000 x double]*, [2000 x double]** %5, align 8
  %100 = bitcast [2000 x [2000 x double]]* %98 to i8*
  br label %.lr.ph12.split.us

.lr.ph12.split.us:                                ; preds = %._crit_edge.us, %.lr.ph12..lr.ph12.split.us_crit_edge
  %indvars.iv96 = phi i64 [ 0, %.lr.ph12..lr.ph12.split.us_crit_edge ], [ %101, %._crit_edge.us ]
  %scevgep152 = getelementptr [2000 x double], [2000 x double]* %99, i64 %indvars.iv96, i64 0
  %101 = add i64 %indvars.iv96, 1
  %scevgep154 = getelementptr [2000 x double], [2000 x double]* %99, i64 %101, i64 0
  %scevgep156 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %98, i64 0, i64 %indvars.iv96, i64 0
  %scevgep158 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %98, i64 0, i64 %101, i64 0
  %bound0160 = icmp ult double* %scevgep152, %scevgep158
  %bound1161 = icmp ult double* %scevgep156, %scevgep154
  %memcheck.conflict163 = and i1 %bound0160, %bound1161
  br i1 %memcheck.conflict163, label %scalar.ph149.preheader, label %vector.body147.preheader

vector.body147.preheader:                         ; preds = %.lr.ph12.split.us
  br label %vector.body147

scalar.ph149.preheader:                           ; preds = %.lr.ph12.split.us
  br label %scalar.ph149

vector.body147:                                   ; preds = %vector.body147, %vector.body147.preheader
  %index166 = phi i64 [ 0, %vector.body147.preheader ], [ %index.next167.1, %vector.body147 ]
  %102 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %98, i64 0, i64 %indvars.iv96, i64 %index166
  %103 = bitcast double* %102 to <2 x i64>*
  %wide.load174 = load <2 x i64>, <2 x i64>* %103, align 8, !alias.scope !13
  %104 = getelementptr double, double* %102, i64 2
  %105 = bitcast double* %104 to <2 x i64>*
  %wide.load175 = load <2 x i64>, <2 x i64>* %105, align 8, !alias.scope !13
  %106 = getelementptr inbounds [2000 x double], [2000 x double]* %99, i64 %indvars.iv96, i64 %index166
  %107 = bitcast double* %106 to <2 x i64>*
  store <2 x i64> %wide.load174, <2 x i64>* %107, align 8, !alias.scope !16, !noalias !13
  %108 = getelementptr double, double* %106, i64 2
  %109 = bitcast double* %108 to <2 x i64>*
  store <2 x i64> %wide.load175, <2 x i64>* %109, align 8, !alias.scope !16, !noalias !13
  %index.next167 = or i64 %index166, 4
  %110 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %98, i64 0, i64 %indvars.iv96, i64 %index.next167
  %111 = bitcast double* %110 to <2 x i64>*
  %wide.load174.1 = load <2 x i64>, <2 x i64>* %111, align 8, !alias.scope !13
  %112 = getelementptr double, double* %110, i64 2
  %113 = bitcast double* %112 to <2 x i64>*
  %wide.load175.1 = load <2 x i64>, <2 x i64>* %113, align 8, !alias.scope !13
  %114 = getelementptr inbounds [2000 x double], [2000 x double]* %99, i64 %indvars.iv96, i64 %index.next167
  %115 = bitcast double* %114 to <2 x i64>*
  store <2 x i64> %wide.load174.1, <2 x i64>* %115, align 8, !alias.scope !16, !noalias !13
  %116 = getelementptr double, double* %114, i64 2
  %117 = bitcast double* %116 to <2 x i64>*
  store <2 x i64> %wide.load175.1, <2 x i64>* %117, align 8, !alias.scope !16, !noalias !13
  %index.next167.1 = add nsw i64 %index166, 8
  %118 = icmp eq i64 %index.next167.1, 2000
  br i1 %118, label %._crit_edge.us.loopexit176, label %vector.body147, !llvm.loop !18

scalar.ph149:                                     ; preds = %scalar.ph149, %scalar.ph149.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph149.preheader ], [ %indvars.iv.next.4, %scalar.ph149 ]
  %119 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %98, i64 0, i64 %indvars.iv96, i64 %indvars.iv
  %120 = bitcast double* %119 to i64*
  %121 = load i64, i64* %120, align 8
  %122 = getelementptr inbounds [2000 x double], [2000 x double]* %99, i64 %indvars.iv96, i64 %indvars.iv
  %123 = bitcast double* %122 to i64*
  store i64 %121, i64* %123, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %124 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %98, i64 0, i64 %indvars.iv96, i64 %indvars.iv.next
  %125 = bitcast double* %124 to i64*
  %126 = load i64, i64* %125, align 8
  %127 = getelementptr inbounds [2000 x double], [2000 x double]* %99, i64 %indvars.iv96, i64 %indvars.iv.next
  %128 = bitcast double* %127 to i64*
  store i64 %126, i64* %128, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %129 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %98, i64 0, i64 %indvars.iv96, i64 %indvars.iv.next.1
  %130 = bitcast double* %129 to i64*
  %131 = load i64, i64* %130, align 8
  %132 = getelementptr inbounds [2000 x double], [2000 x double]* %99, i64 %indvars.iv96, i64 %indvars.iv.next.1
  %133 = bitcast double* %132 to i64*
  store i64 %131, i64* %133, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %134 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %98, i64 0, i64 %indvars.iv96, i64 %indvars.iv.next.2
  %135 = bitcast double* %134 to i64*
  %136 = load i64, i64* %135, align 8
  %137 = getelementptr inbounds [2000 x double], [2000 x double]* %99, i64 %indvars.iv96, i64 %indvars.iv.next.2
  %138 = bitcast double* %137 to i64*
  store i64 %136, i64* %138, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %139 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %98, i64 0, i64 %indvars.iv96, i64 %indvars.iv.next.3
  %140 = bitcast double* %139 to i64*
  %141 = load i64, i64* %140, align 8
  %142 = getelementptr inbounds [2000 x double], [2000 x double]* %99, i64 %indvars.iv96, i64 %indvars.iv.next.3
  %143 = bitcast double* %142 to i64*
  store i64 %141, i64* %143, align 8
  %exitcond95.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond95.4, label %._crit_edge.us.loopexit, label %scalar.ph149, !llvm.loop !19

._crit_edge.us.loopexit:                          ; preds = %scalar.ph149
  br label %._crit_edge.us

._crit_edge.us.loopexit176:                       ; preds = %vector.body147
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit176, %._crit_edge.us.loopexit
  %144 = icmp slt i64 %101, 2000
  br i1 %144, label %.lr.ph12.split.us, label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge.us
  call void @free(i8* %100) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32, [2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
.lr.ph60:
  br label %5

; <label>:5:                                      ; preds = %._crit_edge54, %.lr.ph60
  %indvars.iv128 = phi i64 [ %indvars.iv.next129, %._crit_edge54 ], [ 0, %.lr.ph60 ]
  %indvars.iv120 = phi i32 [ %indvars.iv.next121, %._crit_edge54 ], [ -1, %.lr.ph60 ]
  %6 = add i64 %indvars.iv128, 4294967295
  %7 = and i64 %6, 4294967295
  %8 = icmp sgt i64 %indvars.iv128, 0
  br i1 %8, label %.lr.ph40.preheader, label %._crit_edge54

.lr.ph40.preheader:                               ; preds = %5
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv128, i64 0
  br label %.lr.ph40

.lr.ph40:                                         ; preds = %.lr.ph40.preheader, %._crit_edge71
  %indvars.iv111 = phi i64 [ %indvars.iv.next112, %._crit_edge71 ], [ 0, %.lr.ph40.preheader ]
  %indvars.iv107 = phi i32 [ %indvars.iv.next108, %._crit_edge71 ], [ -1, %.lr.ph40.preheader ]
  %10 = add i64 %indvars.iv111, 4294967295
  %11 = and i64 %10, 4294967295
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv128, i64 %indvars.iv111
  %13 = load double, double* %12, align 8
  %14 = icmp sgt i64 %indvars.iv111, 0
  br i1 %14, label %.lr.ph34.preheader, label %._crit_edge71

.lr.ph34.preheader:                               ; preds = %.lr.ph40
  %wide.trip.count109 = zext i32 %indvars.iv107 to i64
  %15 = and i64 %10, 1
  %lcmp.mod153 = icmp eq i64 %15, 0
  br i1 %lcmp.mod153, label %.lr.ph34.prol.preheader, label %.lr.ph34.prol.loopexit.unr-lcssa

.lr.ph34.prol.preheader:                          ; preds = %.lr.ph34.preheader
  br label %.lr.ph34.prol

.lr.ph34.prol:                                    ; preds = %.lr.ph34.prol.preheader
  %16 = load double, double* %9, align 8
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv111
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = fsub double %13, %19
  br label %.lr.ph34.prol.loopexit.unr-lcssa

.lr.ph34.prol.loopexit.unr-lcssa:                 ; preds = %.lr.ph34.preheader, %.lr.ph34.prol
  %.lcssa146.unr.ph = phi double [ %20, %.lr.ph34.prol ], [ undef, %.lr.ph34.preheader ]
  %indvars.iv101.unr.ph = phi i64 [ 1, %.lr.ph34.prol ], [ 0, %.lr.ph34.preheader ]
  %.unr154.ph = phi double [ %20, %.lr.ph34.prol ], [ %13, %.lr.ph34.preheader ]
  br label %.lr.ph34.prol.loopexit

.lr.ph34.prol.loopexit:                           ; preds = %.lr.ph34.prol.loopexit.unr-lcssa
  %21 = icmp eq i64 %11, 0
  br i1 %21, label %._crit_edge71.loopexit, label %.lr.ph34.preheader.new

.lr.ph34.preheader.new:                           ; preds = %.lr.ph34.prol.loopexit
  br label %.lr.ph34

.lr.ph34:                                         ; preds = %.lr.ph34, %.lr.ph34.preheader.new
  %indvars.iv101 = phi i64 [ %indvars.iv101.unr.ph, %.lr.ph34.preheader.new ], [ %indvars.iv.next102.1, %.lr.ph34 ]
  %22 = phi double [ %.unr154.ph, %.lr.ph34.preheader.new ], [ %36, %.lr.ph34 ]
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv128, i64 %indvars.iv101
  %24 = bitcast double* %23 to <2 x double>*
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv101, i64 %indvars.iv111
  %26 = load double, double* %25, align 8
  %indvars.iv.next102 = add nuw nsw i64 %indvars.iv101, 1
  %27 = load <2 x double>, <2 x double>* %24, align 8
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next102, i64 %indvars.iv111
  %29 = load double, double* %28, align 8
  %30 = insertelement <2 x double> undef, double %26, i32 0
  %31 = insertelement <2 x double> %30, double %29, i32 1
  %32 = fmul <2 x double> %27, %31
  %33 = extractelement <2 x double> %32, i32 0
  %34 = extractelement <2 x double> %32, i32 1
  %35 = fsub double %22, %33
  %36 = fsub double %35, %34
  %exitcond110.1 = icmp eq i64 %indvars.iv.next102, %wide.trip.count109
  %indvars.iv.next102.1 = add nsw i64 %indvars.iv101, 2
  br i1 %exitcond110.1, label %._crit_edge71.loopexit.unr-lcssa, label %.lr.ph34

._crit_edge71.loopexit.unr-lcssa:                 ; preds = %.lr.ph34
  br label %._crit_edge71.loopexit

._crit_edge71.loopexit:                           ; preds = %.lr.ph34.prol.loopexit, %._crit_edge71.loopexit.unr-lcssa
  %.lcssa146 = phi double [ %.lcssa146.unr.ph, %.lr.ph34.prol.loopexit ], [ %36, %._crit_edge71.loopexit.unr-lcssa ]
  br label %._crit_edge71

._crit_edge71:                                    ; preds = %._crit_edge71.loopexit, %.lr.ph40
  %37 = phi double [ %13, %.lr.ph40 ], [ %.lcssa146, %._crit_edge71.loopexit ]
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv111, i64 %indvars.iv111
  %39 = load double, double* %38, align 8
  %40 = fdiv double %37, %39
  store double %40, double* %12, align 8
  %indvars.iv.next112 = add nuw i64 %indvars.iv111, 1
  %41 = icmp slt i64 %indvars.iv.next112, %indvars.iv128
  %indvars.iv.next108 = add nsw i32 %indvars.iv107, 1
  br i1 %41, label %.lr.ph40, label %.lr.ph53

.lr.ph53:                                         ; preds = %._crit_edge71
  br i1 true, label %.lr.ph53.split.us.preheader, label %.lr.ph53.._crit_edge54_crit_edge

.lr.ph53.._crit_edge54_crit_edge:                 ; preds = %.lr.ph53
  br label %._crit_edge54

.lr.ph53.split.us.preheader:                      ; preds = %.lr.ph53
  %wide.trip.count122 = zext i32 %indvars.iv120 to i64
  %42 = and i64 %6, 1
  %lcmp.mod158 = icmp eq i64 %42, 0
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv128, i64 0
  %44 = icmp eq i64 %7, 0
  br label %.lr.ph53.split.us

.lr.ph53.split.us:                                ; preds = %.lr.ph53.split.us.preheader, %._crit_edge47.us
  %indvars.iv126 = phi i64 [ %indvars.iv.next127, %._crit_edge47.us ], [ %indvars.iv128, %.lr.ph53.split.us.preheader ]
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv128, i64 %indvars.iv126
  %46 = load double, double* %45, align 8
  br i1 %lcmp.mod158, label %.prol.preheader155, label %.prol.loopexit156.unr-lcssa

.prol.preheader155:                               ; preds = %.lr.ph53.split.us
  br label %47

; <label>:47:                                     ; preds = %.prol.preheader155
  %48 = load double, double* %43, align 8
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv126
  %50 = load double, double* %49, align 8
  %51 = fmul double %48, %50
  %52 = fsub double %46, %51
  br label %.prol.loopexit156.unr-lcssa

.prol.loopexit156.unr-lcssa:                      ; preds = %.lr.ph53.split.us, %47
  %.lcssa147.unr.ph = phi double [ %52, %47 ], [ undef, %.lr.ph53.split.us ]
  %indvars.iv114.unr.ph = phi i64 [ 1, %47 ], [ 0, %.lr.ph53.split.us ]
  %.unr159.ph = phi double [ %52, %47 ], [ %46, %.lr.ph53.split.us ]
  br label %.prol.loopexit156

.prol.loopexit156:                                ; preds = %.prol.loopexit156.unr-lcssa
  br i1 %44, label %._crit_edge47.us, label %.lr.ph53.split.us.new

.lr.ph53.split.us.new:                            ; preds = %.prol.loopexit156
  br label %53

; <label>:53:                                     ; preds = %53, %.lr.ph53.split.us.new
  %indvars.iv114 = phi i64 [ %indvars.iv114.unr.ph, %.lr.ph53.split.us.new ], [ %indvars.iv.next115.1, %53 ]
  %54 = phi double [ %.unr159.ph, %.lr.ph53.split.us.new ], [ %68, %53 ]
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv128, i64 %indvars.iv114
  %56 = bitcast double* %55 to <2 x double>*
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv114, i64 %indvars.iv126
  %58 = load double, double* %57, align 8
  %indvars.iv.next115 = add nuw nsw i64 %indvars.iv114, 1
  %59 = load <2 x double>, <2 x double>* %56, align 8
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next115, i64 %indvars.iv126
  %61 = load double, double* %60, align 8
  %62 = insertelement <2 x double> undef, double %58, i32 0
  %63 = insertelement <2 x double> %62, double %61, i32 1
  %64 = fmul <2 x double> %59, %63
  %65 = extractelement <2 x double> %64, i32 0
  %66 = extractelement <2 x double> %64, i32 1
  %67 = fsub double %54, %65
  %68 = fsub double %67, %66
  %exitcond123.1 = icmp eq i64 %indvars.iv.next115, %wide.trip.count122
  %indvars.iv.next115.1 = add nsw i64 %indvars.iv114, 2
  br i1 %exitcond123.1, label %._crit_edge47.us.unr-lcssa, label %53

._crit_edge47.us.unr-lcssa:                       ; preds = %53
  br label %._crit_edge47.us

._crit_edge47.us:                                 ; preds = %.prol.loopexit156, %._crit_edge47.us.unr-lcssa
  %.lcssa147 = phi double [ %.lcssa147.unr.ph, %.prol.loopexit156 ], [ %68, %._crit_edge47.us.unr-lcssa ]
  store double %.lcssa147, double* %45, align 8
  %indvars.iv.next127 = add nuw i64 %indvars.iv126, 1
  %69 = icmp slt i64 %indvars.iv.next127, 2000
  br i1 %69, label %.lr.ph53.split.us, label %._crit_edge54.loopexit

._crit_edge54.loopexit:                           ; preds = %._crit_edge47.us
  br label %._crit_edge54

._crit_edge54:                                    ; preds = %.lr.ph53.._crit_edge54_crit_edge, %._crit_edge54.loopexit, %5
  %indvars.iv.next129 = add nuw i64 %indvars.iv128, 1
  %70 = icmp slt i64 %indvars.iv.next129, 2000
  %indvars.iv.next121 = add nsw i32 %indvars.iv120, 1
  br i1 %70, label %5, label %.lr.ph27.preheader

.lr.ph27.preheader:                               ; preds = %._crit_edge54
  br label %.lr.ph27

.lr.ph27:                                         ; preds = %.lr.ph27.preheader, %._crit_edge77
  %indvars.iv99 = phi i64 [ %indvars.iv.next100, %._crit_edge77 ], [ 0, %.lr.ph27.preheader ]
  %indvars.iv95 = phi i32 [ %indvars.iv.next96, %._crit_edge77 ], [ -1, %.lr.ph27.preheader ]
  %71 = add i64 %indvars.iv99, 4294967295
  %72 = and i64 %71, 4294967295
  %73 = getelementptr inbounds double, double* %2, i64 %indvars.iv99
  %74 = bitcast double* %73 to i64*
  %75 = load i64, i64* %74, align 8
  %76 = icmp sgt i64 %indvars.iv99, 0
  br i1 %76, label %.lr.ph21, label %._crit_edge77

.lr.ph21:                                         ; preds = %.lr.ph27
  %77 = bitcast i64 %75 to double
  %wide.trip.count97 = zext i32 %indvars.iv95 to i64
  %xtraiter148 = and i64 %indvars.iv99, 3
  %lcmp.mod149 = icmp eq i64 %xtraiter148, 0
  br i1 %lcmp.mod149, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph21
  br label %78

; <label>:78:                                     ; preds = %78, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %78 ], [ 0, %.prol.preheader ]
  %79 = phi double [ %85, %78 ], [ %77, %.prol.preheader ]
  %prol.iter150 = phi i64 [ %prol.iter150.sub, %78 ], [ %xtraiter148, %.prol.preheader ]
  %80 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv99, i64 %indvars.iv.prol
  %81 = load double, double* %80, align 8
  %82 = getelementptr inbounds double, double* %4, i64 %indvars.iv.prol
  %83 = load double, double* %82, align 8
  %84 = fmul double %81, %83
  %85 = fsub double %79, %84
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter150.sub = add i64 %prol.iter150, -1
  %prol.iter150.cmp = icmp eq i64 %prol.iter150.sub, 0
  br i1 %prol.iter150.cmp, label %.prol.loopexit.unr-lcssa, label %78, !llvm.loop !20

.prol.loopexit.unr-lcssa:                         ; preds = %78
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph21, %.prol.loopexit.unr-lcssa
  %.lcssa145.unr = phi double [ undef, %.lr.ph21 ], [ %85, %.prol.loopexit.unr-lcssa ]
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph21 ], [ %indvars.iv.next.prol, %.prol.loopexit.unr-lcssa ]
  %.unr151 = phi double [ %77, %.lr.ph21 ], [ %85, %.prol.loopexit.unr-lcssa ]
  %86 = icmp ult i64 %72, 3
  br i1 %86, label %._crit_edge22, label %.lr.ph21.new

.lr.ph21.new:                                     ; preds = %.prol.loopexit
  br label %87

; <label>:87:                                     ; preds = %87, %.lr.ph21.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %.lr.ph21.new ], [ %indvars.iv.next.3, %87 ]
  %88 = phi double [ %.unr151, %.lr.ph21.new ], [ %110, %87 ]
  %89 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv99, i64 %indvars.iv
  %90 = bitcast double* %89 to <2 x double>*
  %91 = getelementptr inbounds double, double* %4, i64 %indvars.iv
  %92 = bitcast double* %91 to <2 x double>*
  %93 = load <2 x double>, <2 x double>* %90, align 8
  %94 = load <2 x double>, <2 x double>* %92, align 8
  %95 = fmul <2 x double> %93, %94
  %96 = extractelement <2 x double> %95, i32 0
  %97 = extractelement <2 x double> %95, i32 1
  %98 = fsub double %88, %96
  %99 = fsub double %98, %97
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %100 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv99, i64 %indvars.iv.next.1
  %101 = bitcast double* %100 to <2 x double>*
  %102 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next.1
  %103 = bitcast double* %102 to <2 x double>*
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %104 = load <2 x double>, <2 x double>* %101, align 8
  %105 = load <2 x double>, <2 x double>* %103, align 8
  %106 = fmul <2 x double> %104, %105
  %107 = extractelement <2 x double> %106, i32 0
  %108 = extractelement <2 x double> %106, i32 1
  %109 = fsub double %99, %107
  %110 = fsub double %109, %108
  %exitcond98.3 = icmp eq i64 %indvars.iv.next.2, %wide.trip.count97
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  br i1 %exitcond98.3, label %._crit_edge22.unr-lcssa, label %87

._crit_edge22.unr-lcssa:                          ; preds = %87
  br label %._crit_edge22

._crit_edge22:                                    ; preds = %.prol.loopexit, %._crit_edge22.unr-lcssa
  %.lcssa145 = phi double [ %.lcssa145.unr, %.prol.loopexit ], [ %110, %._crit_edge22.unr-lcssa ]
  %111 = bitcast double %.lcssa145 to i64
  br label %._crit_edge77

._crit_edge77:                                    ; preds = %.lr.ph27, %._crit_edge22
  %112 = phi i64 [ %111, %._crit_edge22 ], [ %75, %.lr.ph27 ]
  %113 = getelementptr inbounds double, double* %4, i64 %indvars.iv99
  %114 = bitcast double* %113 to i64*
  store i64 %112, i64* %114, align 8
  %indvars.iv.next100 = add nuw i64 %indvars.iv99, 1
  %115 = icmp slt i64 %indvars.iv.next100, 2000
  %indvars.iv.next96 = add nsw i32 %indvars.iv95, 1
  br i1 %115, label %.lr.ph27, label %._crit_edge83.preheader

._crit_edge83.preheader:                          ; preds = %._crit_edge77
  %sunkaddr = ptrtoint double* %3 to i64
  br label %._crit_edge83

._crit_edge83:                                    ; preds = %._crit_edge83.preheader, %._crit_edge81
  %indvar = phi i64 [ 0, %._crit_edge83.preheader ], [ %indvar.next, %._crit_edge81 ]
  %indvars.iv89 = phi i64 [ 2000, %._crit_edge83.preheader ], [ %indvars.iv.next90, %._crit_edge81 ]
  %116 = add i64 %indvar, -1
  %indvars.iv.next90 = add i64 %indvars.iv89, -1
  %117 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next90
  %118 = load double, double* %117, align 8
  %119 = icmp slt i64 %indvars.iv89, 2000
  br i1 %119, label %.lr.ph.preheader, label %._crit_edge81

.lr.ph.preheader:                                 ; preds = %._crit_edge83
  %xtraiter = and i64 %indvar, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol, %.lr.ph.prol.preheader
  %indvars.iv87.prol = phi i64 [ %indvars.iv.next88.prol, %.lr.ph.prol ], [ %indvars.iv89, %.lr.ph.prol.preheader ]
  %120 = phi double [ %126, %.lr.ph.prol ], [ %118, %.lr.ph.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %121 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next90, i64 %indvars.iv87.prol
  %122 = load double, double* %121, align 8
  %123 = getelementptr inbounds double, double* %3, i64 %indvars.iv87.prol
  %124 = load double, double* %123, align 8
  %125 = fmul double %122, %124
  %126 = fsub double %120, %125
  %indvars.iv.next88.prol = add i64 %indvars.iv87.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.unr-lcssa, label %.lr.ph.prol, !llvm.loop !22

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.preheader, %.lr.ph.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %.lr.ph.preheader ], [ %126, %.lr.ph.prol.loopexit.unr-lcssa ]
  %indvars.iv87.unr = phi i64 [ %indvars.iv89, %.lr.ph.preheader ], [ %indvars.iv.next88.prol, %.lr.ph.prol.loopexit.unr-lcssa ]
  %.unr = phi double [ %118, %.lr.ph.preheader ], [ %126, %.lr.ph.prol.loopexit.unr-lcssa ]
  %127 = icmp ult i64 %116, 3
  br i1 %127, label %._crit_edge81.loopexit, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %indvars.iv87 = phi i64 [ %indvars.iv87.unr, %.lr.ph.preheader.new ], [ %indvars.iv.next88.3, %.lr.ph ]
  %128 = phi double [ %.unr, %.lr.ph.preheader.new ], [ %150, %.lr.ph ]
  %129 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next90, i64 %indvars.iv87
  %130 = bitcast double* %129 to <2 x double>*
  %131 = getelementptr inbounds double, double* %3, i64 %indvars.iv87
  %132 = bitcast double* %131 to <2 x double>*
  %133 = load <2 x double>, <2 x double>* %130, align 8
  %134 = load <2 x double>, <2 x double>* %132, align 8
  %135 = fmul <2 x double> %133, %134
  %136 = extractelement <2 x double> %135, i32 0
  %137 = extractelement <2 x double> %135, i32 1
  %138 = fsub double %128, %136
  %139 = fsub double %138, %137
  %indvars.iv.next88.1 = add i64 %indvars.iv87, 2
  %140 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next90, i64 %indvars.iv.next88.1
  %141 = bitcast double* %140 to <2 x double>*
  %142 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next88.1
  %143 = bitcast double* %142 to <2 x double>*
  %indvars.iv.next88.2 = add i64 %indvars.iv87, 3
  %144 = load <2 x double>, <2 x double>* %141, align 8
  %145 = load <2 x double>, <2 x double>* %143, align 8
  %146 = fmul <2 x double> %144, %145
  %147 = extractelement <2 x double> %146, i32 0
  %148 = extractelement <2 x double> %146, i32 1
  %149 = fsub double %139, %147
  %150 = fsub double %149, %148
  %exitcond.3 = icmp eq i64 %indvars.iv.next88.2, 1999
  %indvars.iv.next88.3 = add i64 %indvars.iv87, 4
  br i1 %exitcond.3, label %._crit_edge81.loopexit.unr-lcssa, label %.lr.ph

._crit_edge81.loopexit.unr-lcssa:                 ; preds = %.lr.ph
  br label %._crit_edge81.loopexit

._crit_edge81.loopexit:                           ; preds = %.lr.ph.prol.loopexit, %._crit_edge81.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %150, %._crit_edge81.loopexit.unr-lcssa ]
  br label %._crit_edge81

._crit_edge81:                                    ; preds = %._crit_edge81.loopexit, %._crit_edge83
  %151 = phi double [ %118, %._crit_edge83 ], [ %.lcssa, %._crit_edge81.loopexit ]
  %152 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next90, i64 %indvars.iv.next90
  %153 = load double, double* %152, align 8
  %154 = fdiv double %151, %153
  %sunkaddr136 = shl i64 %indvars.iv89, 3
  %sunkaddr137 = add i64 %sunkaddr, %sunkaddr136
  %sunkaddr138 = add i64 %sunkaddr137, -8
  %sunkaddr139 = inttoptr i64 %sunkaddr138 to double*
  store double %154, double* %sunkaddr139, align 8
  %155 = icmp sgt i64 %indvars.iv89, 1
  %indvar.next = add i64 %indvar, 1
  br i1 %155, label %._crit_edge83, label %._crit_edge80

._crit_edge80:                                    ; preds = %._crit_edge81
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
.lr.ph:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge2, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge2 ]
  %6 = trunc i64 %indvars.iv to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %._crit_edge2

; <label>:9:                                      ; preds = %._crit_edge3
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %10) #6
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge3, %9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #7
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %15 = icmp slt i64 %indvars.iv.next, 2000
  br i1 %15, label %._crit_edge3, label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge2
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #6
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
