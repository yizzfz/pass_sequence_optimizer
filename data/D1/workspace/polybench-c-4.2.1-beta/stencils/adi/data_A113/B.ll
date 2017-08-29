; ModuleID = 'A.ll'
source_filename = "adi.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"u\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = bitcast i8* %3 to [1000 x double]*
  tail call fastcc void @init_array([1000 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  tail call fastcc void @kernel_adi([1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
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
  %16 = bitcast i8* %3 to [1000 x double]*
  tail call fastcc void @print_array([1000 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([1000 x double]*) unnamed_addr #2 {
  br label %.preheader

.preheader:                                       ; preds = %1, %16
  %.01214 = phi i32 [ 0, %1 ], [ %17, %16 ]
  %2 = add nuw nsw i32 %.01214, 1000
  %3 = sext i32 %.01214 to i64
  %4 = sext i32 %2 to i64
  br label %5

; <label>:5:                                      ; preds = %5, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %5 ]
  %6 = sub nuw nsw i64 %4, %indvars.iv
  %7 = trunc i64 %6 to i32
  %8 = sitofp i32 %7 to double
  %9 = fdiv double %8, 1.000000e+03
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %3, i64 %indvars.iv
  store double %9, double* %10, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %11 = sub nuw nsw i64 %4, %indvars.iv.next
  %12 = trunc i64 %11 to i32
  %13 = sitofp i32 %12 to double
  %14 = fdiv double %13, 1.000000e+03
  %15 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %3, i64 %indvars.iv.next
  store double %14, double* %15, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1000
  br i1 %exitcond.1, label %16, label %5

; <label>:16:                                     ; preds = %5
  %17 = add nsw i32 %.01214, 1
  %18 = icmp slt i32 %17, 1000
  br i1 %18, label %.preheader, label %19

; <label>:19:                                     ; preds = %16
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi([1000 x double]*, [1000 x double]*, [1000 x double]*, [1000 x double]*) unnamed_addr #2 {
  br label %.preheader152

.preheader152:                                    ; preds = %4, %._crit_edge166
  %.0167 = phi i32 [ 1, %4 ], [ %176, %._crit_edge166 ]
  br label %.lver.check

.lver.check:                                      ; preds = %87, %.preheader152
  %indvar = phi i64 [ %indvar.next, %87 ], [ 0, %.preheader152 ]
  %.0149155.us = phi i32 [ %88, %87 ], [ 1, %.preheader152 ]
  %5 = add i64 %indvar, 1
  %6 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %2, i64 %6, i64 0
  %scevgep2 = getelementptr [1000 x double], [1000 x double]* %2, i64 %6, i64 999
  %scevgep4 = getelementptr [1000 x double], [1000 x double]* %3, i64 %6, i64 0
  %scevgep6 = getelementptr [1000 x double], [1000 x double]* %3, i64 %6, i64 999
  %7 = sext i32 %.0149155.us to i64
  %8 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 0, i64 %7
  store double 1.000000e+00, double* %8, align 8
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %7, i64 0
  store double 0.000000e+00, double* %9, align 8
  %10 = bitcast double* %8 to i64*
  %11 = load i64, i64* %10, align 8
  %12 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %7
  %13 = bitcast [1000 x double]* %12 to i64*
  store i64 %11, i64* %13, align 8
  %14 = add nsw i32 %.0149155.us, -1
  %15 = sext i32 %14 to i64
  %16 = add nuw nsw i32 %.0149155.us, 1
  %17 = sext i32 %16 to i64
  %bound0 = icmp ult double* %scevgep, %scevgep6
  %bound1 = icmp ult double* %scevgep4, %scevgep2
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig.preheader, %.ph.lver.orig
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %.ph.lver.orig ], [ 1, %.ph.lver.orig.preheader ]
  %18 = add nsw i64 %indvars.iv.lver.orig, -1
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %7, i64 %18
  %20 = load double, double* %19, align 8
  %21 = fmul double %20, 0xC09F400000000001
  %22 = fadd double %21, 0x40AF420000000001
  %23 = fdiv double 0x409F400000000001, %22
  %24 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %7, i64 %indvars.iv.lver.orig
  store double %23, double* %24, align 8
  %25 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv.lver.orig, i64 %15
  %26 = load double, double* %25, align 8
  %27 = fmul double %26, 0xC08F400000000001
  %28 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv.lver.orig, i64 %7
  %29 = load double, double* %28, align 8
  %30 = fmul double %29, 0xC09F3C0000000001
  %31 = fsub double %30, %27
  %32 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv.lver.orig, i64 %17
  %33 = load double, double* %32, align 8
  %34 = fmul double %33, 0xC08F400000000001
  %35 = fsub double %31, %34
  %36 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %7, i64 %18
  %37 = load double, double* %36, align 8
  %38 = fmul double %37, 0xC09F400000000001
  %39 = fsub double %35, %38
  %40 = load double, double* %19, align 8
  %41 = fmul double %40, 0xC09F400000000001
  %42 = fadd double %41, 0x40AF420000000001
  %43 = fdiv double %39, %42
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %7, i64 %indvars.iv.lver.orig
  store double %43, double* %44, align 8
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.next.lver.orig, 999
  br i1 %exitcond.lver.orig, label %._crit_edge.us.loopexit, label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %scevgep8 = getelementptr [1000 x double], [1000 x double]* %2, i64 %5, i64 0
  %scevgep11 = getelementptr [1000 x double], [1000 x double]* %3, i64 %5, i64 0
  %load_initial = load double, double* %scevgep8, align 8
  %load_initial12 = load double, double* %scevgep11, align 8
  br label %45

; <label>:45:                                     ; preds = %45, %.ph
  %store_forwarded13 = phi double [ %load_initial12, %.ph ], [ %65, %45 ]
  %store_forwarded10 = phi double [ %load_initial, %.ph ], [ %48, %45 ]
  %indvars.iv = phi i64 [ 1, %.ph ], [ %indvars.iv.next, %45 ]
  %46 = fmul double %store_forwarded10, 0xC09F400000000001
  %47 = fadd double %46, 0x40AF420000000001
  %48 = fdiv double 0x409F400000000001, %47
  %49 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %7, i64 %indvars.iv
  store double %48, double* %49, align 8
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %15
  %51 = load double, double* %50, align 8
  %52 = fmul double %51, 0xC08F400000000001
  %53 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %7
  %54 = load double, double* %53, align 8
  %55 = fmul double %54, 0xC09F3C0000000001
  %56 = fsub double %55, %52
  %57 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %17
  %58 = load double, double* %57, align 8
  %59 = fmul double %58, 0xC08F400000000001
  %60 = fsub double %56, %59
  %61 = fmul double %store_forwarded13, 0xC09F400000000001
  %62 = fsub double %60, %61
  %63 = fmul double %store_forwarded10, 0xC09F400000000001
  %64 = fadd double %63, 0x40AF420000000001
  %65 = fdiv double %62, %64
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %7, i64 %indvars.iv
  store double %65, double* %66, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 999
  br i1 %exitcond, label %._crit_edge.us.loopexit39, label %45

._crit_edge.us.loopexit:                          ; preds = %.ph.lver.orig
  br label %._crit_edge.us

._crit_edge.us.loopexit39:                        ; preds = %45
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit39, %._crit_edge.us.loopexit
  %67 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 999, i64 %7
  store double 1.000000e+00, double* %67, align 8
  br label %68

; <label>:68:                                     ; preds = %68, %._crit_edge.us
  %indvars.iv168 = phi i64 [ 998, %._crit_edge.us ], [ %indvars.iv.next169.1, %68 ]
  %69 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %7, i64 %indvars.iv168
  %70 = load double, double* %69, align 8
  %71 = or i64 %indvars.iv168, 1
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %71, i64 %7
  %73 = load double, double* %72, align 8
  %74 = fmul double %70, %73
  %75 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %7, i64 %indvars.iv168
  %76 = load double, double* %75, align 8
  %77 = fadd double %74, %76
  %78 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv168, i64 %7
  store double %77, double* %78, align 8
  %indvars.iv.next169 = add nsw i64 %indvars.iv168, -1
  %79 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %7, i64 %indvars.iv.next169
  %80 = load double, double* %79, align 8
  %81 = fmul double %80, %77
  %82 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %7, i64 %indvars.iv.next169
  %83 = load double, double* %82, align 8
  %84 = fadd double %81, %83
  %85 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next169, i64 %7
  store double %84, double* %85, align 8
  %indvars.iv.next169.1 = add nsw i64 %indvars.iv168, -2
  %86 = icmp sgt i64 %indvars.iv.next169, 1
  br i1 %86, label %68, label %87

; <label>:87:                                     ; preds = %68
  %88 = add nsw i32 %.0149155.us, 1
  %89 = icmp slt i32 %88, 999
  %indvar.next = add i64 %indvar, 1
  br i1 %89, label %.lver.check, label %.lver.check28.preheader

.lver.check28.preheader:                          ; preds = %87
  br label %.lver.check28

.lver.check28:                                    ; preds = %.lver.check28.preheader, %173
  %indvar14 = phi i64 [ %indvar.next15, %173 ], [ 0, %.lver.check28.preheader ]
  %.1163.us = phi i32 [ %174, %173 ], [ 1, %.lver.check28.preheader ]
  %90 = add i64 %indvar14, 1
  %91 = add i64 %indvar14, 1
  %scevgep16 = getelementptr [1000 x double], [1000 x double]* %2, i64 %91, i64 0
  %scevgep18 = getelementptr [1000 x double], [1000 x double]* %2, i64 %91, i64 999
  %scevgep20 = getelementptr [1000 x double], [1000 x double]* %3, i64 %91, i64 0
  %scevgep22 = getelementptr [1000 x double], [1000 x double]* %3, i64 %91, i64 999
  %92 = sext i32 %.1163.us to i64
  %93 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %92
  %94 = getelementptr inbounds [1000 x double], [1000 x double]* %93, i64 0, i64 0
  store double 1.000000e+00, double* %94, align 8
  %95 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %92, i64 0
  store double 0.000000e+00, double* %95, align 8
  %96 = bitcast [1000 x double]* %93 to i64*
  %97 = load i64, i64* %96, align 8
  %98 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %92
  %99 = bitcast [1000 x double]* %98 to i64*
  store i64 %97, i64* %99, align 8
  %100 = add nsw i32 %.1163.us, -1
  %101 = sext i32 %100 to i64
  %102 = add nuw nsw i32 %.1163.us, 1
  %103 = sext i32 %102 to i64
  %bound024 = icmp ult double* %scevgep16, %scevgep22
  %bound125 = icmp ult double* %scevgep20, %scevgep18
  %memcheck.conflict27 = and i1 %bound024, %bound125
  br i1 %memcheck.conflict27, label %.ph29.lver.orig.preheader, label %.ph29

.ph29.lver.orig.preheader:                        ; preds = %.lver.check28
  br label %.ph29.lver.orig

.ph29.lver.orig:                                  ; preds = %.ph29.lver.orig.preheader, %.ph29.lver.orig
  %indvars.iv170.lver.orig = phi i64 [ %indvars.iv.next171.lver.orig, %.ph29.lver.orig ], [ 1, %.ph29.lver.orig.preheader ]
  %104 = add nsw i64 %indvars.iv170.lver.orig, -1
  %105 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %92, i64 %104
  %106 = load double, double* %105, align 8
  %107 = fmul double %106, 0xC08F400000000001
  %108 = fadd double %107, 0x409F440000000001
  %109 = fdiv double 0x408F400000000001, %108
  %110 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %92, i64 %indvars.iv170.lver.orig
  store double %109, double* %110, align 8
  %111 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %101, i64 %indvars.iv170.lver.orig
  %112 = load double, double* %111, align 8
  %113 = fmul double %112, 0xC09F400000000001
  %114 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %92, i64 %indvars.iv170.lver.orig
  %115 = load double, double* %114, align 8
  %116 = fmul double %115, 0xC0AF3E0000000001
  %117 = fsub double %116, %113
  %118 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %103, i64 %indvars.iv170.lver.orig
  %119 = load double, double* %118, align 8
  %120 = fmul double %119, 0xC09F400000000001
  %121 = fsub double %117, %120
  %122 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %92, i64 %104
  %123 = load double, double* %122, align 8
  %124 = fmul double %123, 0xC08F400000000001
  %125 = fsub double %121, %124
  %126 = load double, double* %105, align 8
  %127 = fmul double %126, 0xC08F400000000001
  %128 = fadd double %127, 0x409F440000000001
  %129 = fdiv double %125, %128
  %130 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %92, i64 %indvars.iv170.lver.orig
  store double %129, double* %130, align 8
  %indvars.iv.next171.lver.orig = add nuw nsw i64 %indvars.iv170.lver.orig, 1
  %exitcond172.lver.orig = icmp eq i64 %indvars.iv.next171.lver.orig, 999
  br i1 %exitcond172.lver.orig, label %._crit_edge161.us.loopexit, label %.ph29.lver.orig

.ph29:                                            ; preds = %.lver.check28
  %scevgep30 = getelementptr [1000 x double], [1000 x double]* %2, i64 %90, i64 0
  %scevgep35 = getelementptr [1000 x double], [1000 x double]* %3, i64 %90, i64 0
  %load_initial31 = load double, double* %scevgep30, align 8
  %load_initial36 = load double, double* %scevgep35, align 8
  br label %131

; <label>:131:                                    ; preds = %131, %.ph29
  %store_forwarded37 = phi double [ %load_initial36, %.ph29 ], [ %151, %131 ]
  %store_forwarded34 = phi double [ %load_initial31, %.ph29 ], [ %134, %131 ]
  %indvars.iv170 = phi i64 [ 1, %.ph29 ], [ %indvars.iv.next171, %131 ]
  %132 = fmul double %store_forwarded34, 0xC08F400000000001
  %133 = fadd double %132, 0x409F440000000001
  %134 = fdiv double 0x408F400000000001, %133
  %135 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %92, i64 %indvars.iv170
  store double %134, double* %135, align 8
  %136 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %101, i64 %indvars.iv170
  %137 = load double, double* %136, align 8
  %138 = fmul double %137, 0xC09F400000000001
  %139 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %92, i64 %indvars.iv170
  %140 = load double, double* %139, align 8
  %141 = fmul double %140, 0xC0AF3E0000000001
  %142 = fsub double %141, %138
  %143 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %103, i64 %indvars.iv170
  %144 = load double, double* %143, align 8
  %145 = fmul double %144, 0xC09F400000000001
  %146 = fsub double %142, %145
  %147 = fmul double %store_forwarded37, 0xC08F400000000001
  %148 = fsub double %146, %147
  %149 = fmul double %store_forwarded34, 0xC08F400000000001
  %150 = fadd double %149, 0x409F440000000001
  %151 = fdiv double %148, %150
  %152 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %92, i64 %indvars.iv170
  store double %151, double* %152, align 8
  %indvars.iv.next171 = add nuw nsw i64 %indvars.iv170, 1
  %exitcond172 = icmp eq i64 %indvars.iv.next171, 999
  br i1 %exitcond172, label %._crit_edge161.us.loopexit38, label %131

._crit_edge161.us.loopexit:                       ; preds = %.ph29.lver.orig
  br label %._crit_edge161.us

._crit_edge161.us.loopexit38:                     ; preds = %131
  br label %._crit_edge161.us

._crit_edge161.us:                                ; preds = %._crit_edge161.us.loopexit38, %._crit_edge161.us.loopexit
  %153 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %92, i64 999
  store double 1.000000e+00, double* %153, align 8
  br label %154

; <label>:154:                                    ; preds = %154, %._crit_edge161.us
  %indvars.iv173 = phi i64 [ 998, %._crit_edge161.us ], [ %indvars.iv.next174.1, %154 ]
  %155 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %92, i64 %indvars.iv173
  %156 = load double, double* %155, align 8
  %157 = or i64 %indvars.iv173, 1
  %158 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %92, i64 %157
  %159 = load double, double* %158, align 8
  %160 = fmul double %156, %159
  %161 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %92, i64 %indvars.iv173
  %162 = load double, double* %161, align 8
  %163 = fadd double %160, %162
  %164 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %92, i64 %indvars.iv173
  store double %163, double* %164, align 8
  %indvars.iv.next174 = add nsw i64 %indvars.iv173, -1
  %165 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %92, i64 %indvars.iv.next174
  %166 = load double, double* %165, align 8
  %167 = fmul double %166, %163
  %168 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %92, i64 %indvars.iv.next174
  %169 = load double, double* %168, align 8
  %170 = fadd double %167, %169
  %171 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %92, i64 %indvars.iv.next174
  store double %170, double* %171, align 8
  %indvars.iv.next174.1 = add nsw i64 %indvars.iv173, -2
  %172 = icmp sgt i64 %indvars.iv.next174, 1
  br i1 %172, label %154, label %173

; <label>:173:                                    ; preds = %154
  %174 = add nsw i32 %.1163.us, 1
  %175 = icmp slt i32 %174, 999
  %indvar.next15 = add i64 %indvar14, 1
  br i1 %175, label %.lver.check28, label %._crit_edge166

._crit_edge166:                                   ; preds = %173
  %176 = add nuw nsw i32 %.0167, 1
  %exitcond175 = icmp eq i32 %176, 501
  br i1 %exitcond175, label %177, label %.preheader152

; <label>:177:                                    ; preds = %._crit_edge166
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1000 x double]*) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader

.preheader:                                       ; preds = %1, %21
  %.01113 = phi i32 [ 0, %1 ], [ %22, %21 ]
  %6 = mul nuw nsw i32 %.01113, 1000
  %7 = sext i32 %.01113 to i64
  %8 = zext i32 %6 to i64
  br label %9

; <label>:9:                                      ; preds = %16, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %16 ]
  %10 = add i64 %indvars.iv, %8
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %16

; <label>:16:                                     ; preds = %14, %9
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %7, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %21, label %9

; <label>:21:                                     ; preds = %16
  %22 = add nsw i32 %.01113, 1
  %23 = icmp slt i32 %22, 1000
  br i1 %23, label %.preheader, label %24

; <label>:24:                                     ; preds = %21
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %27) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
