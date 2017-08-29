; ModuleID = 'A.ll'
source_filename = "adi.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"u\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %7 = bitcast i8* %3 to [1000 x double]*
  tail call fastcc void @init_array(i32 1000, [1000 x double]* %7)
  tail call void (...) @polybench_timer_start() #3
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  tail call fastcc void @kernel_adi(i32 500, i32 1000, [1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array(i32 1000, [1000 x double]* %7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* %5) #3
  tail call void @free(i8* %6) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [1000 x double]*) unnamed_addr #0 {
  br label %.preheader

.preheader:                                       ; preds = %15, %2
  %indvars.iv15 = phi i64 [ 0, %2 ], [ %indvars.iv.next16, %15 ]
  %3 = add nuw nsw i64 %indvars.iv15, 1000
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %._crit_edge ]
  %4 = sub nuw nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %6 = sitofp i32 %5 to double
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv15, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %8 = sub nuw nsw i64 %3, %indvars.iv.next
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %9 to double
  %11 = insertelement <2 x double> undef, double %6, i32 0
  %12 = insertelement <2 x double> %11, double %10, i32 1
  %13 = fdiv <2 x double> %12, <double 1.000000e+03, double 1.000000e+03>
  %14 = bitcast double* %7 to <2 x double>*
  store <2 x double> %13, <2 x double>* %14, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1000
  br i1 %exitcond.1, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %._crit_edge
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next16, 1000
  br i1 %exitcond17, label %16, label %.preheader

; <label>:16:                                     ; preds = %15
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_adi(i32, i32, [1000 x double]*, [1000 x double]*, [1000 x double]*, [1000 x double]*) unnamed_addr #0 {
  br label %.preheader152

.preheader152:                                    ; preds = %._crit_edge164, %6
  %.0165 = phi i32 [ 1, %6 ], [ %150, %._crit_edge164 ]
  br label %._crit_edge180.lver.check

._crit_edge180.lver.check:                        ; preds = %77, %.preheader152
  %indvar = phi i64 [ %indvar.next, %77 ], [ 0, %.preheader152 ]
  %indvars.iv168 = phi i64 [ %indvars.iv.next169, %77 ], [ 1, %.preheader152 ]
  %7 = add i64 %indvar, 1
  %8 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %4, i64 %8, i64 0
  %scevgep185 = getelementptr [1000 x double], [1000 x double]* %4, i64 %8, i64 999
  %scevgep187 = getelementptr [1000 x double], [1000 x double]* %5, i64 %8, i64 0
  %scevgep189 = getelementptr [1000 x double], [1000 x double]* %5, i64 %8, i64 999
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv168
  store double 1.000000e+00, double* %9, align 8
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv168, i64 0
  store double 0.000000e+00, double* %10, align 8
  %11 = bitcast double* %9 to i64*
  %12 = load i64, i64* %11, align 8
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv168
  %14 = bitcast [1000 x double]* %13 to i64*
  store i64 %12, i64* %14, align 8
  %15 = add nsw i64 %indvars.iv168, -1
  %indvars.iv.next169 = add nuw nsw i64 %indvars.iv168, 1
  %bound0 = icmp ult double* %scevgep, %scevgep189
  %bound1 = icmp ult double* %scevgep187, %scevgep185
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge180.lver.orig.preheader, label %._crit_edge180.ph

._crit_edge180.lver.orig.preheader:               ; preds = %._crit_edge180.lver.check
  br label %._crit_edge180.lver.orig

._crit_edge180.lver.orig:                         ; preds = %._crit_edge180.lver.orig.preheader, %._crit_edge180.lver.orig
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %._crit_edge180.lver.orig ], [ 1, %._crit_edge180.lver.orig.preheader ]
  %16 = add nsw i64 %indvars.iv.lver.orig, -1
  %17 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv168, i64 %16
  %18 = load double, double* %17, align 8
  %19 = fmul double %18, 0xC09F400000000001
  %20 = fadd double %19, 0x40AF420000000001
  %21 = fdiv double 0x409F400000000001, %20
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv168, i64 %indvars.iv.lver.orig
  store double %21, double* %22, align 8
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %15
  %24 = bitcast double* %23 to <2 x double>*
  %25 = load <2 x double>, <2 x double>* %24, align 8
  %26 = fmul <2 x double> %25, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %27 = extractelement <2 x double> %26, i32 0
  %28 = extractelement <2 x double> %26, i32 1
  %29 = fsub double %28, %27
  %30 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %indvars.iv.next169
  %31 = load double, double* %30, align 8
  %32 = fmul double %31, 0xC08F400000000001
  %33 = fsub double %29, %32
  %34 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv168, i64 %16
  %35 = load double, double* %34, align 8
  %36 = fmul double %35, 0xC09F400000000001
  %37 = fsub double %33, %36
  %38 = fdiv double %37, %20
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv168, i64 %indvars.iv.lver.orig
  store double %38, double* %39, align 8
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.next.lver.orig, 999
  br i1 %exitcond.lver.orig, label %._crit_edge.loopexit, label %._crit_edge180.lver.orig

._crit_edge180.ph:                                ; preds = %._crit_edge180.lver.check
  %scevgep192 = getelementptr [1000 x double], [1000 x double]* %5, i64 %7, i64 0
  %scevgep191 = getelementptr [1000 x double], [1000 x double]* %4, i64 %7, i64 0
  %load_initial = load double, double* %scevgep191, align 8
  %load_initial193 = load double, double* %scevgep192, align 8
  br label %._crit_edge180

._crit_edge180:                                   ; preds = %._crit_edge180, %._crit_edge180.ph
  %store_forwarded194 = phi double [ %load_initial193, %._crit_edge180.ph ], [ %57, %._crit_edge180 ]
  %store_forwarded = phi double [ %load_initial, %._crit_edge180.ph ], [ %42, %._crit_edge180 ]
  %indvars.iv = phi i64 [ 1, %._crit_edge180.ph ], [ %indvars.iv.next, %._crit_edge180 ]
  %40 = fmul double %store_forwarded, 0xC09F400000000001
  %41 = fadd double %40, 0x40AF420000000001
  %42 = fdiv double 0x409F400000000001, %41
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv168, i64 %indvars.iv
  store double %42, double* %43, align 8
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %15
  %45 = bitcast double* %44 to <2 x double>*
  %46 = load <2 x double>, <2 x double>* %45, align 8
  %47 = fmul <2 x double> %46, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %48 = extractelement <2 x double> %47, i32 0
  %49 = extractelement <2 x double> %47, i32 1
  %50 = fsub double %49, %48
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %indvars.iv.next169
  %52 = load double, double* %51, align 8
  %53 = fmul double %52, 0xC08F400000000001
  %54 = fsub double %50, %53
  %55 = fmul double %store_forwarded194, 0xC09F400000000001
  %56 = fsub double %54, %55
  %57 = fdiv double %56, %41
  %58 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv168, i64 %indvars.iv
  store double %57, double* %58, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 999
  br i1 %exitcond, label %._crit_edge.loopexit216, label %._crit_edge180

._crit_edge.loopexit:                             ; preds = %._crit_edge180.lver.orig
  br label %._crit_edge

._crit_edge.loopexit216:                          ; preds = %._crit_edge180
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit216, %._crit_edge.loopexit
  %59 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 999, i64 %indvars.iv168
  store double 1.000000e+00, double* %59, align 8
  br label %60

; <label>:60:                                     ; preds = %60, %._crit_edge
  %indvars.iv166 = phi i64 [ 998, %._crit_edge ], [ %indvars.iv.next167.1, %60 ]
  %61 = phi double [ 1.000000e+00, %._crit_edge ], [ %74, %60 ]
  %62 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv168, i64 %indvars.iv166
  %63 = load double, double* %62, align 8
  %64 = fmul double %63, %61
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv168, i64 %indvars.iv166
  %66 = load double, double* %65, align 8
  %67 = fadd double %64, %66
  %68 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv166, i64 %indvars.iv168
  store double %67, double* %68, align 8
  %indvars.iv.next167 = add nsw i64 %indvars.iv166, -1
  %69 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv168, i64 %indvars.iv.next167
  %70 = load double, double* %69, align 8
  %71 = fmul double %70, %67
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv168, i64 %indvars.iv.next167
  %73 = load double, double* %72, align 8
  %74 = fadd double %71, %73
  %75 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next167, i64 %indvars.iv168
  store double %74, double* %75, align 8
  %76 = icmp sgt i64 %indvars.iv.next167, 1
  %indvars.iv.next167.1 = add nsw i64 %indvars.iv166, -2
  br i1 %76, label %60, label %77

; <label>:77:                                     ; preds = %60
  %exitcond170 = icmp eq i64 %indvars.iv.next169, 999
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond170, label %._crit_edge182.lver.check.preheader, label %._crit_edge180.lver.check

._crit_edge182.lver.check.preheader:              ; preds = %77
  br label %._crit_edge182.lver.check

._crit_edge182.lver.check:                        ; preds = %._crit_edge182.lver.check.preheader, %149
  %indvar195 = phi i64 [ %indvar.next196, %149 ], [ 0, %._crit_edge182.lver.check.preheader ]
  %indvars.iv176 = phi i64 [ %indvars.iv.next177, %149 ], [ 1, %._crit_edge182.lver.check.preheader ]
  %78 = add i64 %indvar195, 1
  %79 = add i64 %indvar195, 1
  %scevgep197 = getelementptr [1000 x double], [1000 x double]* %4, i64 %79, i64 0
  %scevgep199 = getelementptr [1000 x double], [1000 x double]* %4, i64 %79, i64 999
  %scevgep201 = getelementptr [1000 x double], [1000 x double]* %5, i64 %79, i64 0
  %scevgep203 = getelementptr [1000 x double], [1000 x double]* %5, i64 %79, i64 999
  %80 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv176
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %80, i64 0, i64 0
  store double 1.000000e+00, double* %81, align 8
  %82 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv176, i64 0
  store double 0.000000e+00, double* %82, align 8
  %83 = bitcast [1000 x double]* %80 to i64*
  %84 = load i64, i64* %83, align 8
  %85 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv176
  %86 = bitcast [1000 x double]* %85 to i64*
  store i64 %84, i64* %86, align 8
  %87 = add nsw i64 %indvars.iv176, -1
  %indvars.iv.next177 = add nuw nsw i64 %indvars.iv176, 1
  %bound0205 = icmp ult double* %scevgep197, %scevgep203
  %bound1206 = icmp ult double* %scevgep201, %scevgep199
  %memcheck.conflict208 = and i1 %bound0205, %bound1206
  br i1 %memcheck.conflict208, label %._crit_edge182.lver.orig.preheader, label %._crit_edge182.ph

._crit_edge182.lver.orig.preheader:               ; preds = %._crit_edge182.lver.check
  br label %._crit_edge182.lver.orig

._crit_edge182.lver.orig:                         ; preds = %._crit_edge182.lver.orig.preheader, %._crit_edge182.lver.orig
  %indvars.iv171.lver.orig = phi i64 [ %indvars.iv.next172.lver.orig, %._crit_edge182.lver.orig ], [ 1, %._crit_edge182.lver.orig.preheader ]
  %88 = add nsw i64 %indvars.iv171.lver.orig, -1
  %89 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv176, i64 %88
  %90 = load double, double* %89, align 8
  %91 = fmul double %90, 0xC08F400000000001
  %92 = fadd double %91, 0x409F440000000001
  %93 = fdiv double 0x408F400000000001, %92
  %94 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv176, i64 %indvars.iv171.lver.orig
  store double %93, double* %94, align 8
  %95 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %87, i64 %indvars.iv171.lver.orig
  %96 = load double, double* %95, align 8
  %97 = fmul double %96, 0xC09F400000000001
  %98 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv176, i64 %indvars.iv171.lver.orig
  %99 = load double, double* %98, align 8
  %100 = fmul double %99, 0xC0AF3E0000000001
  %101 = fsub double %100, %97
  %102 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next177, i64 %indvars.iv171.lver.orig
  %103 = load double, double* %102, align 8
  %104 = fmul double %103, 0xC09F400000000001
  %105 = fsub double %101, %104
  %106 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv176, i64 %88
  %107 = load double, double* %106, align 8
  %108 = fmul double %107, 0xC08F400000000001
  %109 = fsub double %105, %108
  %110 = fdiv double %109, %92
  %111 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv176, i64 %indvars.iv171.lver.orig
  store double %110, double* %111, align 8
  %indvars.iv.next172.lver.orig = add nuw nsw i64 %indvars.iv171.lver.orig, 1
  %exitcond173.lver.orig = icmp eq i64 %indvars.iv.next172.lver.orig, 999
  br i1 %exitcond173.lver.orig, label %._crit_edge160.loopexit, label %._crit_edge182.lver.orig

._crit_edge182.ph:                                ; preds = %._crit_edge182.lver.check
  %scevgep212 = getelementptr [1000 x double], [1000 x double]* %5, i64 %78, i64 0
  %scevgep209 = getelementptr [1000 x double], [1000 x double]* %4, i64 %78, i64 0
  %load_initial210 = load double, double* %scevgep209, align 8
  %load_initial213 = load double, double* %scevgep212, align 8
  br label %._crit_edge182

._crit_edge182:                                   ; preds = %._crit_edge182, %._crit_edge182.ph
  %store_forwarded214 = phi double [ %load_initial213, %._crit_edge182.ph ], [ %129, %._crit_edge182 ]
  %store_forwarded211 = phi double [ %load_initial210, %._crit_edge182.ph ], [ %114, %._crit_edge182 ]
  %indvars.iv171 = phi i64 [ 1, %._crit_edge182.ph ], [ %indvars.iv.next172, %._crit_edge182 ]
  %112 = fmul double %store_forwarded211, 0xC08F400000000001
  %113 = fadd double %112, 0x409F440000000001
  %114 = fdiv double 0x408F400000000001, %113
  %115 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv176, i64 %indvars.iv171
  store double %114, double* %115, align 8
  %116 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %87, i64 %indvars.iv171
  %117 = load double, double* %116, align 8
  %118 = fmul double %117, 0xC09F400000000001
  %119 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv176, i64 %indvars.iv171
  %120 = load double, double* %119, align 8
  %121 = fmul double %120, 0xC0AF3E0000000001
  %122 = fsub double %121, %118
  %123 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next177, i64 %indvars.iv171
  %124 = load double, double* %123, align 8
  %125 = fmul double %124, 0xC09F400000000001
  %126 = fsub double %122, %125
  %127 = fmul double %store_forwarded214, 0xC08F400000000001
  %128 = fsub double %126, %127
  %129 = fdiv double %128, %113
  %130 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv176, i64 %indvars.iv171
  store double %129, double* %130, align 8
  %indvars.iv.next172 = add nuw nsw i64 %indvars.iv171, 1
  %exitcond173 = icmp eq i64 %indvars.iv.next172, 999
  br i1 %exitcond173, label %._crit_edge160.loopexit215, label %._crit_edge182

._crit_edge160.loopexit:                          ; preds = %._crit_edge182.lver.orig
  br label %._crit_edge160

._crit_edge160.loopexit215:                       ; preds = %._crit_edge182
  br label %._crit_edge160

._crit_edge160:                                   ; preds = %._crit_edge160.loopexit215, %._crit_edge160.loopexit
  %131 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv176, i64 999
  store double 1.000000e+00, double* %131, align 8
  br label %132

; <label>:132:                                    ; preds = %132, %._crit_edge160
  %indvars.iv174 = phi i64 [ 998, %._crit_edge160 ], [ %indvars.iv.next175.1, %132 ]
  %133 = phi double [ 1.000000e+00, %._crit_edge160 ], [ %146, %132 ]
  %134 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv176, i64 %indvars.iv174
  %135 = load double, double* %134, align 8
  %136 = fmul double %135, %133
  %137 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv176, i64 %indvars.iv174
  %138 = load double, double* %137, align 8
  %139 = fadd double %136, %138
  %140 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv176, i64 %indvars.iv174
  store double %139, double* %140, align 8
  %indvars.iv.next175 = add nsw i64 %indvars.iv174, -1
  %141 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv176, i64 %indvars.iv.next175
  %142 = load double, double* %141, align 8
  %143 = fmul double %142, %139
  %144 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv176, i64 %indvars.iv.next175
  %145 = load double, double* %144, align 8
  %146 = fadd double %143, %145
  %147 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv176, i64 %indvars.iv.next175
  store double %146, double* %147, align 8
  %148 = icmp sgt i64 %indvars.iv.next175, 1
  %indvars.iv.next175.1 = add nsw i64 %indvars.iv174, -2
  br i1 %148, label %132, label %149

; <label>:149:                                    ; preds = %132
  %exitcond178 = icmp eq i64 %indvars.iv.next177, 999
  %indvar.next196 = add i64 %indvar195, 1
  br i1 %exitcond178, label %._crit_edge164, label %._crit_edge182.lver.check

._crit_edge164:                                   ; preds = %149
  %150 = add nuw nsw i32 %.0165, 1
  %exitcond179 = icmp eq i32 %150, 501
  br i1 %exitcond179, label %151, label %.preheader152

; <label>:151:                                    ; preds = %._crit_edge164
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1000 x double]*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #4
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader

.preheader:                                       ; preds = %18, %2
  %indvars.iv14 = phi i64 [ 0, %2 ], [ %indvars.iv.next15, %18 ]
  %7 = mul nuw nsw i64 %indvars.iv14, 1000
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %8 = add nuw nsw i64 %indvars.iv, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %._crit_edge17
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge17, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv14, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %18, label %._crit_edge17

; <label>:18:                                     ; preds = %._crit_edge
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next15, 1000
  br i1 %exitcond16, label %19, label %.preheader

; <label>:19:                                     ; preds = %18
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
